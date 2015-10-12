PLoS one Scentific publication in laTeX
=======================================

What ?
------
look at the damn title. This repo contains the latex file and instructions to publish
in PLoS.

### Call for Papers target discussion topics
Although, PLoS-ONE journal has no topic restrictions some publication criteria has to
be met. See [study types guidelines](http://journals.plos.org/plosone/s/submission-guidelines#loc-guidelines-for-specific-study-types)
for more information.

### Important dates
(check-list to keep track of the dates)

* [ ] **xxxx-xx-xx xx:xx PM PST** Registration of paper with title, abstract and authors
* [ ] **xxxx-xx-xx xx:xx PM PST** Full paper submission deadline
* [ ] **xxxx-xx-xx xx:xx PM PST** Supplementary material deadline

### Submission Guidelines 
Here is a selection of [submission guidelines](http://journals.plos.org/plosone/s/submission-guidelines#loc-style-and-format)
required to publish at PLoS-ONE.

* [ ] Manuscript can be any lenght.
* [ ] LaTeX2e is required.
* [ ] Do not create a heading level below \subsection. For 3rd level headings, use \paragraph{}.
* [ ] Do not include colors of graphics in the text.

#### Figure guidelines
* [ ] Include figures directly after first citation.
* [ ] Figures MUST be separate TIFF or EPS files.
* [ ] Figures generated using LaTeX should be extracted and removed from the PDF before submission.
	- [Howto export EPS from TIKz](http://tex.stackexchange.com/questions/8641/export-eps-figures-from-tikz)
* [ ] Figures containing multiple panels/subfigures must be combined into one image file before submission.
* [ ] For figure citations, please use "Fig." instead of "Figure".

Look at [PLOS figure guidelines](http://www.plosone.org/static/figureGuidelines) for more details.

#### Table guidelines
Tables should be cell-based and may not contain:
	- tabs/spacing/line breaks within cells to alter layout or alignment
	- vertically-merged cells (no tabular environments within tabular environments, do not use \multirow)
	- colors, shading, or graphic objects

Look at [table guidelines](http://www.plosone.org/static/figureGuidelines#tables) for more details.

#### Equation, math symbols, subscripts and superscripts

* Do not include text that is not math in the math environment. For example, CO2 will be CO\textsubscript{2}.
* Please add line breaks to long display equations when possible in order to fit size of the column. 
* For inline equations, please do not include punctuation (commas, etc) within the math environment unless this is part of the equation.

Look at [LaTeX guidelines](http://www.plosone.org/static/latexGuidelines) for details.

#### Bibliography
* [ ] Bibligraphy integrated into tex file (no .bib, .bbl)

How ?
-----

### Structure
The primary file is called main.tex, and contains the bare essential and the abstract to get an idea of the content at a glance. The content is imported using include and input. Latex packages, acronyms, etc.. are called using input directly meanwhile the chapters (or sections) are called using include. If a chapter source requires from an external file, this is imported using input (in the further included chapter file).

The document structure is as follows
```
    .
    |____.gitattributes       % indicates git how to treat pdf and latex files
    |____.gitignore           % indicates git which files to ignore
    |____.git
    | |__ % Contains all the info regarding the repository
    |
    |____master.pdf           % document output
    |____main.tex           % document source
    |____README.md            % this document you are reading.
    |
    |____content
    | |   % This folder contains any file related with the content of the
    | |   % document. Each capter (or section) are stored in separated
    | |   % folders, which contain a figures subdirectory. Other content
    | |   % refering to the whole document such as frontmatter, acronyms
    | |   % and bibliography can be found directly in this content folder.
    | |
    | |____acronym_definition.tex
    | |____frontmatter.tex
    | |____literature_review.bib
    | |
    | |____intro
    | | |____intro.tex
    | |____other
    | | |____cite_examples.tex              % how-to use biblatex
    | | |____other.tex
    |
    |____latex
    | |   % This folder contains all the files regarding the behaviour of
    | |   % the document. Filesystem contains packages, styles, etc..
    | |   % If fonts or other resources are needed they must be found here
    | |
    | |____filesystem
    | | |____package.tex
    | | |____fileSetup.tex
    | |____fonts
```

### Latex Packages
PLoS-ONE has no restrictions on package use within the LaTeX files except that
no packages listed in the template may be deleted. Those packages can be found
at `./latex/filesystem/plos_packages.tex`.


The cross indicates, that they have a usage example in this template.

* [ ] [biblatex](http://www.ctan.org/pkg/biblatex) using a biber backend
* [x] graphicx
* [x] newclude
* [x] acro using marcos=true, which allow for \myTriger instead of \ac{myTriger}
* [x] hyperref
* [x] cleveref
* [x] lipsum


### Procedure
The master branch should be stay clean. Every conceptual increment (or todo item) should generate an issue. In order to address the issue a branch should be created and worked out. Once the issue is finished the master is checked out and the branch merged. If a issue needs to be reopen the issue is checked out, merged to master and reworked. Consider to open a new issue instead of reopening a previous one when possible.

### LaTeX Copmpilation

* Usual latex run

  ```
  latex main
  bibtex main
  latex main
  latex main
  dvipdf main
  ```

* Automated compilation with preview (my choice, using *latexmk* and *xelatex*)

  ```
  latexmk -pvc --pdf main.tex
  ```

### Important Note:
Keeping this file updated is important, it can help in further projects.

### Similar Projects:

* https://github.com/asm-products/Dissertate
* https://github.com/bamos/latex-templates

TODO
----
(Stuff to get done, either in the project or the template, that would depend :))

* [ ] Modify \cref to produce Fig. instad of fig.
* [ ] Task 1
* [ ] Task 2
