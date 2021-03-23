# 508

![gitleaks](https://github.com/NOAA-EDAB/LeMANS/workflows/gitleaks/badge.svg)


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

# Resources for 508 help

1. [Alt text Best Practices](https://www.youtube.com/watch?v=_delzGjIFV4)
1. SSA [Alt text guide](https://www.ssa.gov/accessibility/files/SSA_Alternative_Text_Guide.pdf)
1. WebAIM [web accessibility](https://webaim.org/techniques/alttext/)
1. NOAA Central library [quick start guide](https://libguides.library.noaa.gov/Section508/QuickStart)
1. [508 Accessibility check](https://www.youtube.com/watch?v=7AbwL0GU3m8&list=PLpb5LINL0Ys9LWzCHuxLaiQpX7013d30T&index=9)
1. NOAA IR [Guidelines](https://docs.google.com/document/d/1br7P9iRS91EJ78GPiw1L56kNMYtVNy_rkl44q0u_Mno/edit)

## Contact

| [andybeet](https://github.com/andybeet)        
| ----------------------------------------------------------------------------------------------- 
| [![](https://avatars1.githubusercontent.com/u/22455149?s=100&v=4)](https://github.com/andybeet) | 



#### Legal disclaimer

*This repository is a scientific product and is not official
communication of the National Oceanic and Atmospheric Administration, or
the United States Department of Commerce. All NOAA GitHub project code
is provided on an ‘as is’ basis and the user assumes responsibility for
its use. Any claims against the Department of Commerce or Department of
Commerce bureaus stemming from the use of this GitHub project will be
governed by all applicable Federal law. Any reference to specific
commercial products, processes, or services by service mark, trademark,
manufacturer, or otherwise, does not constitute or imply their
endorsement, recommendation or favoring by the Department of Commerce.
The Department of Commerce seal and logo, or the seal and logo of a DOC
bureau, shall not be used in any manner to imply endorsement of any
commercial product or activity by DOC or the United States Government.*