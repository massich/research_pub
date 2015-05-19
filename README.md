Scientific publication to be published at ACPR-2015 in laTeX
============================================================

What ?
------
look at the damn title. This repo contains the latex for a scientific publication.

After a little description of what's the publication about, the rest of the section
is use to describe the publication's target.

### Call for Papers target discussion topics
(check-list to cross when applies)

* [ ] Computer Vision and Robot Vision;
* [ ] Pattern Recognition and Machine Learning;
* [ ] Signal Processing (signal, speech, image);
* [x] Media Processing and Interaction (video, document, medical, biometrics, HCI, VR)

### Important dates
(check-list to keep track of the dates)

* [  ] **July 10, 2015 - 23:59 (PST)** Full paper submission
* [  ] **August 31, 2015**             Notification of acceptance
* [  ] **September 25, 2015**          Camera ready
* [  ] **September 25, 2015**          Author registration
* [  ] **November 3, 2015**            Workshop/Tutorial
* [  ] **November 4-6, 2015**          Main Conference

### Submission Guidelines 
(check-list to ensure proper submission)

* [x] Papers should be formatted in ACPR2015 style.
* [ ] 8 pages maximum (+1 extra only with references).
* [x] Ruler 
* [ ] The review process is double blind:
  * [x] Remove author and institutional information using the build in macro
  * [ ] Remove author information from all paper headers.
  * [ ] Remove clues from:
    * [ ] Acknowledgment
    * [ ] collaborating partners (hospitals, companies)
    * [ ] Your own published work (including online publications) must be cited in the third person.
* [ ] Miscellaneous:
  * [ ] Ensure the use of the provided macros:
    * `\eg` for e.g.
    * `\etal` for _”et al.”_
  * [ ] Mathematics (check ACPR2015 guidelines)
  * [ ] Color (check ACPR2015 guidelines)

How ?
-----

### Structure
The primary file is called master.tex, and contains the bare essential and the abstract to get an idea of the content at a glance. The content is imported using include and input. Latex packages, acronyms, etc.. are called using input directly meanwhile the chapters (or sections) are called using include. If a chapter source requires from an external file, this is imported using input (in the further included chapter file).

The document structure is as follows
```
    .
    |____.gitattributes       % indicates git how to treat pdf and latex files
    |____.gitignore           % indicates git which files to ignore
    |____.git
    | |__ % Contains all the info regarding the repository
    |
    |____master.pdf           % document output
    |____master.tex           % document source
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
The cross indicates, that they have a usage example in this template.

* [x] [biblatex](http://www.ctan.org/pkg/biblatex) using a biber backend
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
  latex master
  biber master
  latex master
  latex master
  ```

* Automated compilation with preview (my choice, using *latexmk* and *xelatex*)

  ```
  latexmk --xelatex -pvc --pdf master.tex
  ```

### Important Note:
Keeping this file updated is important, it can help in further projects.

### Similar Projects:

* https://github.com/asm-products/Dissertate
* https://github.com/bamos/latex-templates

TODO
----
(Stuff to get done, either in the project or the template, that would depend :))

* [ ] Create a better cleveref example
* [ ] Some compilation erros for the nested acronyms
* [ ] Place a snapshot of each template linking to its *branch*
* [ ] Task 1
* [ ] Task 2
