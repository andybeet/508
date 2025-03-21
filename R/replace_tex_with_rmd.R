#' Read in rmd and replace info in tex
#' 
#' 

replace_tex_with_rmd <- function(filename="SOE-MAFMC-2025") {

  ## snippet of text to add to tex file
addText <- "\\DocumentMetadata{
 lang=en,
 pdfversion=2.0,
 pdfstandard=ua-2,
 pdfstandard=a-4,
 testphase=
   {
    phase-III, %lists,footnotes,sectioning,
               %toc,marginpar,bibliography,floats,
               %graphics ...
    math,  
    table, %tabular, tabularx, longtable
    title  %maketitle
   }
 }"

# read in rmd file
con <- file(here::here(paste0(filename,".Rmd")), open = "r")
rmd <- readLines(con)
close(con)
# find rchunk label and fig.alt/cap text for ecodata objects
rchunkLines <- grepl("^```\\{r",rmd)
rchunks <- rmd[rchunkLines]


# find line that is chunk header
chunkNameString <- stringr::str_extract(rchunks,"```\\{r\\,*\\s+([a-z0-9A-Z-]+)")
chunkNames <- gsub("```\\{r,*\\s+","",chunkNameString)
# grab fig.cap/alt section of chunk header
figAltString <- stringr::str_extract(rchunks,"fig.cap\\s*=\\s*.*") 
figAltString <- stringr::str_extract(rchunks,"fig\\.cap\\s*=\\s*([\"\'])(?:(?=(\\\\?))\\2.)*?\\1") 
figAlts <- gsub("fig\\.cap\\s*=\\s*[\\\"']","",figAltString)
# substiture \" or ' for empty string
figAlts <- gsub("\"","",figAlts)
figAlts <- gsub("'","",figAlts)

figAltNames <- gsub("\"}","",figAlts)

# replace all figAltNames with NA
#figAltNames[!is.na(figAltNames)] <- NA

##### replace tex with rmd
# open tex file
con <- file(here::here(paste0(filename,".tex")), open = "r")
tex <- readLines(con)
close(con)

# find lines with only % and replace with text variable
commentLines <- which(grepl("^%$",tex))
pre <- tex[1:(commentLines-1)]
post <- tex[(commentLines+1):length(tex)]
newTex <- c(pre,addText,post)

# now substitute the rmd chunk names and fig.alt names
for(i in 1:length(chunkNames)){
  texSection <- paste0(filename,"_files/figure-latex/",chunkNames[i],"-1")
  rowid <- which(grepl(texSection,newTex))
  line <- newTex[rowid]
  if (length(line) == 0) {next}

  # find text within square brackets in line includegraphics in the tex file
  sqbrackets <- stringr::str_extract(line,"\\[([\\.A-Za-z0-9=\\\\]+)\\]")
  if (!is.na(sqbrackets)) {
    # add to alt text to this
    newSqbrackets <- sub("]",paste0(",alt=",figAltNames[i],"]"),sqbrackets)
    # some of the existing commands in tex file have \\ entries
    sqbrackets <- gsub("\\\\","\\\\\\\\",sqbrackets)
    newSqbrackets <- gsub("\\\\","\\\\\\\\",newSqbrackets)
    newTex[rowid] <- stringr::str_replace(newTex[rowid],paste0("\\",sqbrackets),newSqbrackets)
  } else { # no square brackets
    sqbrackets <- stringr::str_extract(line,"\\includegraphics")
    newSqbrackets <- sub(sqbrackets,paste0(sqbrackets,"[alt=",figAltNames[i],"]"),line)
    #newTex[rowid] <- newSqbrackets
    newTex[rowid] <- newSqbrackets
  }


  
  # find text in line with innclude graphics without square brackets
  #stringr::str_extract(line,"\\[([\\S]+)\\]")
  #newTex[rowid] <- gsub(chunkNames[i],figAltNames[i],newTex)
}


# write newTex to file
con <- file(here::here(paste0(filename,"b_test.tex")), open = "w")
writeLines(newTex, con)
close(con)

return(list(chunk=chunkNames,figAlt=figAltNames))

}
