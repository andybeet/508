# Create an accessible pdf from markdown


- [Introduction](#Introduction)
  - [Reference word document (template)](#Reference-word-document-(template))
- [Testing figure sizes](#testing-figure-sizes)


# Introduction

Convert markdown/Rmarkdown files to pdf via word to ensure accessibility checks pass.

* Write document in markdown
* Save as R markdown and add yaml header
    + output to docx via a reference doc (template)
* Open word doc and convert to pdf

## Reference word document (template)

To have control over formatting you will need to create a template word docx file.
This file should specify things like:

* Title
* Heading 1
* Heading 2
* ...
* Footers
* Headers
* Fonts
* Image styling

etc.

# Testing figure sizes

All images were created with a resolution of 96 dpi.

Each figure has different number of horizontal and vertical pixels. 

Mouse over the image to see its dimensions


![Figure: Dimensions 400 x 200](figures/test1.png "400 x 200") 

![Figure: Dimensions 600 x 200](figures/test5.png "600 x 400") 

![Figure: Dimensions 800 x 200](figures/test9.png "800 x 600") 

![Figure: Dimensions 1000 x 200](figures/test13.png "1000 x 800") 

![Figure: Dimensions 400 x 400](figures/test2.png "400 x 200" ) 

![Figure: Dimensions 600 x 400](figures/test6.png "600 x 400") 

![Figure: Dimensions 800 x 400](figures/test10.png "800 x 600") 

![Figure: Dimensions 1000 x 400](figures/test14.png "1000 x 800") 

![Figure: Dimensions 400 x 600](figures/test3.png "400 x 200") 

![Figure: Dimensions 600 x 600](figures/test7.png "600 x 400") 

![Figure: Dimensions 800 x 600](figures/test11.png "800 x 600") 

![Figure: Dimensions 1000 x 600](figures/test15.png "1000 x 800") 
