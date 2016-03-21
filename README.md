IEEEtransactions Scentific publication in laTeX
===============================================

What ?
------
look at the damn title. This repo contains the latex file and
instructions to publish in IEEE-transactions format. This document
is an adaptation of
[mvpgomes’s IEEE-latex-template](https://github.com/mvpgomes/ieee-latex-template.git)
, which follows the official documentation provided at the
[IEEE](https://www.ieee.org/publications_standards/publications/authors/author_templates.html)
and the documentation developed by Michael Shell, the IEEEtran
original author that provided a guide ``IEEEtran_HOWTO.pdf`` with
all information needed to produce an IEEE compliant article in
LateX.

The default configurations for this template are:
```latex
\documentclass[journal,twocolumn,letterpaper,10pt]{IEEEtran}
```

### Important dates
(check-list to keep track of the dates)

* [ ] **xxxx-xx-xx xx:xx PM PST** Registration of paper with title, abstract and authors
* [ ] **xxxx-xx-xx xx:xx PM PST** Full paper submission deadline
* [ ] **xxxx-xx-xx xx:xx PM PST** Supplementary material deadline

### Submission Guidelines
(Complete this according to your publication target)

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

### IEEE-trans Latex Package Restrictions
**TO BE CHECKED**
PLoS-ONE has no restrictions on package use within the LaTeX files except that
no packages listed in the template may be deleted. Those packages can be found
at `./latex/filesystem/plos_packages.tex`.

* LateX: This will depend on your Operating System. You have to check how to install all Latex packages for your OS.
* Any text editor that supports LateX (e.g. [Atom](https://atom.io/), [Sublime Text](http://www.sublimetext.com/), [Emacs](https://www.gnu.org/software/emacs/), etc.)
* LaTeX plugins for your text editor (this is optional, but it will make your life easier).
I you use Atom (that is my case) the following ones are available:
  * [language-latex](https://atom.io/packages/language-latex)
  * [latex](https://atom.io/packages/latex)
  * [latexer](https://atom.io/packages/latexer)

The cross indicates, that they have a usage example in this template.

* [ ] [biblatex](http://www.ctan.org/pkg/biblatex) using a biber backend
* [x] bibliography using `ieetrans`
* [x] graphicx
* [x] newclude
* [ ] acro using marcos=true, which allow for \myTriger instead of \ac{myTriger}
* [x] aronyms using `glosary` package
* [x] hyperref
* [x] cleveref
* [x] lipsum

```
biblatex, acro don’t work
```
### Procedure
The master branch should be stay clean. Every conceptual increment (or todo item) should generate an issue. In order to address the issue a branch should be created and worked out. Once the issue is finished the master is checked out and the branch merged. If a issue needs to be reopen the issue is checked out, merged to master and reworked. Consider to open a new issue instead of reopening a previous one when possible.

### Starting your Article
The first thing that you need to do is to update the article's title and author information at the ```variables.tex```
file.

```latex
% Article Title
\def \ArticleTitle{Your Article Title}
% Author name
\def \AuthorA{Your Name}
% Author email
\def \AuthorAemail{Your email}
% Institution
\def \InstitutionA{Your Institution}
```
If you article has multiple authors and/or institutions, you must edit this information at ```variables.tex```
file by defining new variables and updating the respective commands. The information regarding how to
have multiple authors/institutions is available at ``IEEEtran_HOWTO.pdf``.

### Abstract
The file for the article abstract are located in  ```abstract/abstract.tex```. To define your abstract
just edit that file.

### Keywords
The file for the article keywords are located in  ```keywords/keywords.tex```. To define your keywords
just edit that file.

### Sections
Sections are located at ```sections```folder.
To create a new section, you first need to create a file in this folder.
The easiest way to do this, is to create a new file file:

```sh
$ touch sections/your_section_name.tex
```

In the new file, change the section's title and label.

Now you just need to include this new section in the main file in ```section``` folder.
Open ```section/main.tex``` file and add the include for the new section:

```latex
\input{sections/your_section_name}
```

Now get to work and start writing your article.

### Figures
Image files go to ```figures``` directory.
Place your files here and include them in the body of your document.

### Bibliography
The bibliography is in a ``.bib`` file located at ```bibliography/article.bib```.

The IEEEtran specification requires that to print the article bibliography you must have at least
one citation in you document, otherwise you will get a compilation error. To fix that issue we
define the ``hasBibliography`` variable that us located at the variables file:

```latex
\def \hasBibliography{1}
```
The default value specifies that the bibliography must be generated. If you don't want, just that change the variable value to 0.

To cite a bibliography entry in your document you can use the following command, as demonstrated
in ```sections/introduction.tex```:

```latex
\cite{johndoe}
```

### Acronyms
The list of acronyms is located at ```acronyms/acronyms.tex```.  To define a new acronym in your document you must define the new entry in that file:

```latex
\newacronym{<label>}{<abbreviation>}{<full>}
```
To reference an acronym you can use:

```latex
\gls{<label>}
```
If you are referring the acronym for the first time it will show in you document the ```<abbreviation>``` and
```<full>``` tags. At the remaining references it will show only the ```<abbreviation>``` tag.

To reference an acronym in the plural form you can use the following command:

```latex
\glspl{<label>}
```

The full documentation of the ```acronyms``` package is available at [LaTeX Glossary Wiki](https://en.wikibooks.org/wiki/LaTeX/Glossary)
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
#### Using the provided scripts
If you have the complete LateX environment installed, you can run the ```toPDF.sh``` script to generate the PDF (```article.pdf```):
```
$ sh toPDF.sh
```

To clean the files generated at the compilation process, you can run ```clean.sh``` script:
```
$ sh clean.sh
```

#### Using Grunt
Using Grunt is optional, but if you choose to use these option you will make the development of you document much more efficient, since that each time that a ``.tex`` file is saved, the whole document is compiled again. The requirements to use Grunt are:

- [NodeJS](https://nodejs.org/)
- [NPM](https://www.npmjs.com/)
- [Grunt-CLI](http://gruntjs.com/)

After install this components you need to change to the project's root directory and install
the project dependencies by running:
```
$ npm install
```
And then you already can run Grunt:
```
$ grunt
```
Now you can edit you LateX document. When you save the changes, your document will be compiled automatically.

NOTE: If you are using grunt you must not delete the ```toPDF.sh``` and ```clean.sh``` because it uses those scripts.

#### Using the Makefile
There is a ```Makefile``` in the project's root.
If you have `pdflatex` and `bibtex` executables available on your 'Path' you can use this make file.
Simply run:
```
$ make
```

To clean all the mess generated by the compilation process you can run:
```
$ make clean
```

#### Using an online tool
If you don't want to install anything and just want to use an online editor you can also use this template.

For instance, [Overleaf](https://www.overleaf.com) is a LateX online editor. You just need to create an account
and import the files on this template to it, or use one of the IEEE templates that Overleaf provides.

NOTE: If you chose to use a template already provided by Overleaf, the template structure will be a little
different. If you want to keep your article document structure more organized, we recommend that you use
this template.

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
