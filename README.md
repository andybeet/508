# 508

![gitleaks](https://github.com/andybeet/508/workflows/gitleaks/badge.svg)


# Who is this document for?

This document is for people who prefer to use flavors of markdown for their document writing instead of Microsoft Word.
When writing in markdown issues arise when converting to pdf. In particular alt text for images are not displayed or transferred resulting in pdfs failing to pass accessibility checks. This document attempts to resolve this issue.

Steps are provided to help create 508 compliant pdfs in two different ways:

* Using word as a template doc
* Editing intermediate tex files

* To review outcomes perform a `full check` of your pdf (found in the accessibility tab)

# Contents

An example text file in markdown is provided (`example.md`). 

An equivalent Rmarkdown file is provided (`example.rmd`). 
  - The difference is only the inclusion of a YAML header.

A second Rmarkdown file is provided (`example2.rmd`). 
  - A code chunk is used instead of markdown to include images plus a YAML header.
  - The resulting pdf (`example.pdf`) is provided as the final product
  - A template word file (`reference.docx`) is provided to demonstrate examples of formatting.

Example `example3.rmd` demonstrates how to include alt text for images without using word as a template. This is done by keeping the intermediate tex file and modifying it (very slightly) before converting to a pdf. The resulting pdf passes accessibility checks albeit with not very descriptive alt text. This can be improved by including alt text in the rmd code chunk and running a script (`R/replace_tex_with_rmd()`) to modify the tex file further.
  - An intermediate `example3.tex` file is provided to demonstrate the changes made to the tex file.


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
