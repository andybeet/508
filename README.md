# 508

# Who is this document for?

This document is for people who prefer to use flavors of markdown for their document writing instead of Microsoft Word.
When writing in markdown issues arise when converting to pdf. In particular alt text for images are not displayed or transfered resulting in pdfs failing to pass accessibility checks. This document attempts to resolve this issue.

Steps are provided to help create 508 compliant pdfs

* Write document in markdown
* Save as R markdown and add yaml header
    + output to docx via a reference doc (template)
* Knit the Rmd file
* Open word doc and convert to pdf
* Open pdf and perform a `full check` (found in the accessibility tab)

# Contents

An example text file in markdown is provided (`example.md`). 

An equivalent Rmarkdown file is provided (`example.rmd`). The difference is only the includion of a YAML header.

A second Rmarkdown file is provided (`example2.rmd`). Where a code chunk is used instead of markdown to include images plus a YAML header.

The resulting pdf (`example.pdf`) is provided as the final product

A template word file (`reference.docx`) is provided to demonstrate examples of formatting.
