#' Use alt text in rmd file to populate tex file
#' 
#' @description Read in rmd file and use the fig.cap/fig.alt text in the rmd file
#' to populate the alt text in the tex file. This currently only works with 
#' images created on the fly in a code chunk and not with images included 
#' using knitr. 
#' 
#' There are still some characters that if present in the fig.cap/fig.alt text
#' cause problems in the rendering of the tex file. The full list is not known
#' 
#' @params filename. character name of the rmd file
#' @params text. character name of the text label to replace in the tex file
#' 

replace_tex_with_rmd <- function(filename="example3",text="fig.cap") {
  
  ## snippet of text to add to tex file
addText <- "\\DocumentMetadata{
 lang=en,
 pdfversion=2.0,
 pdfstandard=ua-2,
 pdfstandard=a-4,
 testphase= latest
}"

    
   # phase-III, %lists,footnotes,sectioning,
   #             %toc,marginpar,bibliography,floats,
   #             %graphics ...
   #  math,
   #  table, %tabular, tabularx, longtable
   #  title  %maketitle
   

# read in rmd file
con <- file(here::here(paste0(filename,".Rmd")), open = "r")
rmd <- readLines(con)
close(con)
# find rchunk label and fig.alt/cap text for objects
rchunkLines <- grepl("^```\\{r",rmd)
rchunks <- rmd[rchunkLines]


# find line that is chunk header
chunkNameString <- stringr::str_extract(rchunks,"```\\{r\\,*\\s+([a-z0-9A-Z-]+)")
chunkNames <- gsub("```\\{r,*\\s+","",chunkNameString)
# grab fig.cap/alt section of chunk header
if (text == "fig.cap"){ 
  figAltString <- stringr::str_extract(rchunks,"fig.cap\\s*=\\s*.*") 
  figAltString <- stringr::str_extract(rchunks,"fig\\.cap\\s*=\\s*([\"\'])(?:(?=(\\\\?))\\2.)*?\\1") 
  figAlts <- gsub("fig\\.cap\\s*=\\s*[\\\"']","",figAltString)
} else if (text == "fig.alt") {
  figAltString <- stringr::str_extract(rchunks,"fig.alt\\s*=\\s*.*") 
  figAltString <- stringr::str_extract(rchunks,"fig\\.alt\\s*=\\s*([\"\'])(?:(?=(\\\\?))\\2.)*?\\1") 
  figAlts <- gsub("fig\\.alt\\s*=\\s*[\\\"']","",figAltString)
} else {
  error("text must be fig.cap or fig.alt")
}

# clean up stuff. substitute \" or ' for empty string
figAlts <- gsub("\"","",figAlts)
figAlts <- gsub("'","",figAlts)
figAlts <- gsub("\"}","",figAlts)
# Escape special symbols
# in figAlts escape = sign
figAlts <- gsub("="," \\= ",figAlts)
# in figAlts escape parentheses
figAlts <- gsub("\\(","\\\\(",figAlts)
figAlts <- gsub("\\)","\\\\)",figAlts)

figAltNames <- figAlts
# replace all figAltNames with NA
figAltNames[!is.na(figAltNames)] <- "hello"

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

  # Each line is of the form:
  # {\centering \includegraphics[width=0.55\linewidth]{SOE-MAFMC-2025_files/figure-latex/cocobloom-1} 
  # This needs to be changed to something like:
  # {\centering \includegraphics[width=0.55\linewidth,alt=some alt text]{SOE-MAFMC-2025_files/figure-latex/cocobloom-1} 
  # To do this we need to capture the contnt in square brackets, change it and replace it
  
  # find text within square brackets in line includegraphics in the tex file
  sqbrackets <- stringr::str_extract(line,"\\[([\\.A-Za-z0-9=\\\\]+)\\]")
  if (!is.na(sqbrackets)) {
    # add to alt text to this
    newSqbrackets <- paste0(sub("]","",sqbrackets),",alt=\\{",figAltNames[i],"\\}]")
    
    
    # some of the existing commands in tex file have \\ entries
    sqbrackets <- gsub("\\\\","\\\\\\\\",sqbrackets)
    newSqbrackets <- gsub("\\\\","\\\\\\\\",newSqbrackets)
    newTex[rowid] <- stringr::str_replace(newTex[rowid],paste0("\\",sqbrackets),newSqbrackets)
    
  } else { # no square brackets

    print(i)
    sqbrackets <- stringr::str_extract(line,"\\includegraphics")
    newName <- gsub("\\\\","\\\\\\\\",figAltNames[i])
    newSqbrackets <- sub(sqbrackets,paste0(sqbrackets,"[alt=\\{",newName,"\\}]"),line)

    newTex[rowid] <- newSqbrackets
    
  }


  
  # find text in line with innclude graphics without square brackets
  #stringr::str_extract(line,"\\[([\\S]+)\\]")
  #newTex[rowid] <- gsub(chunkNames[i],figAltNames[i],newTex)
}


# write newTex to file
con <- file(here::here(paste0(filename,"_test.tex")), open = "w")
writeLines(newTex, con)
close(con)

return(list(chunk=chunkNames,figAlt=figAltNames))

}
