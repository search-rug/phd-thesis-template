%% searchthesis.cls
%
% *******************************************************************
%
% SEARCH Thesis style
%   LaTeX style for theses of the Software Engineering
%   and Architecture (SEARCH) group of the University of Groningen
%
% -------------------------------------------------------------------
% This style is meant to be used together with the thesis template.
% Please see the README at the root folder of the repository.
%
% *******************************************************************
%
% Versions:
%   - v2022-07-18:
%     - Contributors: Daniel Feitosa
%     - Changelog:
%       - First version      
%       - Parts of the class are based on ILLC's Dissertation style
%   
% *******************************************************************
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{searchthesis}[2022/07/18 SEARCH Thesis Style]
%
% *******************************************************************
% Package options
% *******************************************************************
%
% - OPTION Font size
%
\newcommand{\@mult}{1}
\newcommand{\@typesizeopt}{10pt}
\DeclareOption{10pt}{%
   \renewcommand{\@mult}{1}
   \renewcommand{\@typesizeopt}{10pt}
}
\DeclareOption{11pt}{%
   \renewcommand{\@mult}{1.1}
   \renewcommand{\@typesizeopt}{11pt}
}
\DeclareOption{12pt}{%
   \renewcommand{\@mult}{1.2}
   \renewcommand{\@typesizeopt}{12pt}
}
%
% - OPTION paper sizes
%
\newcommand{\@papersizeopt}{a4paper}
\DeclareOption{a4paper}{\renewcommand{\@papersizeopt}{a4paper}}
\DeclareOption{a5paper}{\renewcommand{\@papersizeopt}{a5paper}}
\DeclareOption{b5paper}{\renewcommand{\@papersizeopt}{b5paper}}
\DeclareOption{letterpaper}{\renewcommand{\@papersizeopt}{letterpaper}}
\DeclareOption{legalpaper}{\renewcommand{\@papersizeopt}{legalpaper}}
\DeclareOption{executivepaper}{\renewcommand{\@papersizeopt}{executivepaper}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
%
% - Load class
%
\ProcessOptions
\LoadClass[\@papersizeopt,\@typesizeopt]{book}
%
% *******************************************************************
% Load packages
% *******************************************************************
%
\RequirePackage{fancyhdr}
%
% *******************************************************************
% Page format
% *******************************************************************
%
% - Set lengths proportional to fontsize
%
%   Height x Width: 182x121mm text on default (A4 297x210mm; 10pt)
%   Scale proportionally to include the same amount of text per line.
%
\renewcommand{\baselinestretch}{1.1}
\newcommand{\setmlength}[3]{\setlength{#1}{#3}\setlength{#1}{#2#1}}
\setmlength{\textheight}{\@mult}{0.613\paperheight}% 0.613 = 182/297 (18.2cm)
\setmlength{\textwidth}{\@mult}{0.614\paperwidth}% 0.614 = 129/210 (12.9 cm)
\setmlength{\headheight}{\@mult}{12pt}
\setmlength{\headsep}{\@mult}{18pt}
\setmlength{\topskip}{\@mult}{10pt}
\setmlength{\footskip}{\@mult}{25pt}
%
% - Margins
%
\setlength{\topmargin}{0.5\paperheight}
\addtolength{\topmargin}{-0.5\textheight}
\addtolength{\topmargin}{-0.5\headheight}
\addtolength{\topmargin}{-0.5\headsep}
\addtolength{\topmargin}{-0.5\footskip}
\addtolength{\topmargin}{-1in}
\setlength{\oddsidemargin}{0.5\paperwidth}
\addtolength{\oddsidemargin}{-0.5\textwidth}
\addtolength{\oddsidemargin}{-1in}
\setlength{\evensidemargin}{\oddsidemargin}
%
% - Text page fractions
%
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{4}     % 2 may work better
\setcounter{dbltopnumber}{2}    % for 2-column pages
\renewcommand{\dbltopfraction}{0.9}	% fit big float above 2-col. text
\renewcommand{\textfraction}{0.07}	% allow minimal text w. figs
%
% - Float page fractions
%
% \renewcommand{\topfraction}{0.99}% max fraction of floats at top
% \renewcommand{\bottomfraction}{0.99}% max fraction of floats at bottom
% \renewcommand{\floatpagefraction}{0.7}%require fuller float pages (MUST be less than topfraction!!)
% \renewcommand{\dblfloatpagefraction}{0.7}	% require fuller float pages
%
% *******************************************************************
% Chapter heads and foots
% *******************************************************************
%
\pagestyle{fancy}
%
% - set vertical spaces proportional to fontsize
%
\newlength{\@spacebeforechapterhead}
\setmlength{\@spacebeforechapterhead}{\@mult}{15pt}
\newlength{\@spaceinchapterhead}
\setmlength{\@spaceinchapterhead}{\@mult}{3.5pt}
\newlength{\@spaceafterchapterhead}
\setmlength{\@spaceafterchapterhead}{\@mult}{60pt}
%
% - chapter head
%
\newcommand{\publicationhead}{}%publication placeholder
%
\renewcommand{\@makechapterhead}[1]{{%
   \thispagestyle{empty}
   \publicationhead
   \vspace*{\@spacebeforechapterhead}%
   \parindent 0pt \Large\bfseries
   \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
         \@chapapp\enspace\thechapter
      \fi
   \fi
   \interlinepenalty\@M
   \vspace*{\@spaceinchapterhead}%
   \hrule
   \vspace*{\@spaceinchapterhead}%
   { \LARGE \bfseries #1}%
   \mbox{}\par
   \mbox{}\par
   \mbox{}\par
}}
%
\renewcommand{\@makeschapterhead}[1]{{%
   \thispagestyle{empty}
   \vspace*{\@spacebeforechapterhead}%
   \parindent 0pt \Large\bfseries
   \phantom{\@chapapp}%
   \interlinepenalty\@M
   \vspace*{\@spaceinchapterhead}%
   \hrule
   \vspace*{\@spaceinchapterhead}%
   {\hfill \LARGE \bfseries #1}%
   \mbox{}\par
   \mbox{}\par
   \mbox{}\par
}}
%
% - redefine marks to remove uppercase
%
\renewcommand{\chaptermark}[1]{\markboth{
   \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter \@chapapp\ \thechapter. \ \fi 
   \fi
   #1}{}}
%
\renewcommand{\sectionmark}[1]{\markright{
   \ifnum \c@secnumdepth >\z@
      \thesection. \ \fi
   #1}{}}
%
% - construct headers
%
\fancyhead[LE,RO]{\thepage}
\fancyhead[RE]{\leftmark}
\fancyhead[LO]{\rightmark}
%
% - remove number from footer
%
\fancyfoot[C]{}
%
% - remove page number and headers on \cleardoublepage
%
\renewcommand{\cleardoublepage}{%
   \clearpage\if@twoside \ifodd\c@page\else
   \hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi
}
%
% *******************************************************************
% Helper functions
% *******************************************************************
%
% - Large first letter (for chapter start)
%
\def\PARstart#1#2{\begingroup\def\par{\endgraf\endgroup\lineskiplimit=0pt}
    \setbox2=\hbox{\lowercase{#2}}\newdimen\tmpht \tmpht \ht2
    \advance\tmpht by \baselineskip\font\hhuge=cmr10 at \tmpht
    \setbox1=\hbox{{\hhuge #1}}
    \count7=\tmpht \count8=\ht1\divide\count8 by 1000 \divide\count7 by\count8
    \tmpht=.001\tmpht\multiply\tmpht by \count7\font\hhuge=cmr10 at \tmpht
    \setbox1=\hbox{{\hhuge #1}} \noindent \hangindent1.05\wd1
    \hangafter=-2 {\hskip-\hangindent \lower1\ht1\hbox{\raise1.0\ht2\copy1}%
    \kern-0\wd1}\copy2\lineskiplimit=-1000pt}
%
% - Reset page number
%
\newcommand{\resetpagenumbers}{
	\pagenumbering{gobble}% Remove page numbers (and reset to 1)
	\addtocounter{page}{-1}%
}
%
% - Create an abstract at the begining of a chapter
%
\newenvironment{chapterabstract}
   {\if@twocolumn
     \small\it Abstract\/\bf---$\!$%
   \else
     \begin{center}\vspace{-0.8em}\small\bfseries Abstract\end{center}\quotation\small
   \fi}
   {\vspace{0.6em}\par\if@twocolumn\else\endquotation\fi}

\endinput
