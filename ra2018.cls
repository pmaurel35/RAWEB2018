%%
%% This is file `ra2005.cls',
%% generated (il y a longtemps) with the docstrip utility.
%%
%% Copyright (C) 1998-2003 2004 2006 INRIA/MIAOU, apics Jose Grimm

%% original dollar-Id: ra2003.cls,v 1.8 2003/12/22 10:43:36 grimm Exp
%% actual xId: ra2004.cls,v 1.1 2006/07/25 13:33:21 grimm Exp $
%% real $Id: raYEAR.cls.in 1232 2007-09-04 09:17:01Z crossi $
%%
%% Nouvelle version ra2018 pour sharelatex.   21/11/2018 
%% 
\def\filedate{2006/07/25}
\def\fileversion{3,2}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ra2018}
       [\filedate\space v\fileversion\space ^^J\space\space\space
         Copyright INRIA/MIAOU/APICS 2007 Raweb in DRAFT mode]

\PassOptionsToClass{a4paper,11pt,twoside,titlepage}{article}
\LoadClass{article}
\RequirePackage{ifpdf}
%\RequirePackage{html}
\RequirePackage{url}
\RequirePackage{footbib}

%% jpj
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{eurosym}
\RequirePackage{textcomp}
%%% end jpj

\ifpdf
\RequirePackage[pdftex]{graphicx}
\RequirePackage[pdftex]{hyperref}
\AtBeginDocument{\def\url{\begingroup \Url}}
\else
\RequirePackage{graphicx}
\fi
\def\htmladdnormallink#1#2{#1}
\RequirePackage[dvips,all,light]{draftcopy}
%\RequirePackage[frenchb]{babel}
\def\numero{n\textsuperscript{o}}
\def\ier{\textsuperscript{er}}
\def\iere{\textsuperscript{re}}
\def\iers{\textsuperscript{ers}}
\def\ieres{\textsuperscript{re}}
\def\ieme{\textsuperscript{e}}
\def\iemes{\textsuperscript{es}}
\let\refercite\cite
\let\yearcite\cite
\let\@ra@url\url
\textwidth=15.65cm
\textheight=21cm
\addtolength\oddsidemargin{-0.8cm}
\addtolength\evensidemargin{-2.3cm}
\addtolength\oddsidemargin{2.5mm}
\let\RAignorename\@gobble
\newcommand\RAstartmodule[4]{%
   \ifx @#4@\else \subsection{#4}\fi}
\let\RAlabel\label
\begingroup
   \catcode`\!\active
   \uccode`\!=`\,%
\uppercase{\endgroup
 \def\ra@specialcomma{: %
    \raggedright
    \ignorespaces
    \catcode`\,\active
    \def!{\string, \ignorespaces}}}
\let\ra@partfont\bf
\newcommand\ra@finpart{\unskip.\par\vspace{3mm}}
\def\participants@name{Participants}
\def\participant@name{Participant}
\newenvironment{participants}
    {\par{\ra@partfont \participants@name}\ra@specialcomma}{\ra@finpart}
\newenvironment{participantes}
    {\par{\ra@partfont \participants@name}\ra@specialcomma}{\ra@finpart}
\newenvironment{participante}
    {\par{\ra@partfont \participant@name}\ra@specialcomma}{\ra@finpart}
\newenvironment{participant}
    {\par{\ra@partfont \participant@name}\ra@specialcomma}{\ra@finpart}
\newenvironment{motscle}
    {\par{\bf Keywords}\ra@specialcomma}{\ra@finpart}
\newcommand\persA[1]{\\#1
   \@ifnextchar[\pers@part\pers@nom}
\def\pers@part[#1]{#1
   \pers@nom}
\def\pers@nom#1{#1%
 \@ifnextchar[\space\relax}
\newcommand\persB[1]{\nopagebreak\item[]#1
   \@ifnextchar[\persB@part\persB@nomx}
\def\persB@part[#1]{#1 \persB@nomx}
\def\persB@nomx#1{\@ifnextchar[{\persB@nomy{#1}}{\persB@nom{#1}}}
\def\persB@nomy#1[#2]{#1 [UR=#2]\persB@nom{}}
\def\persB@nom#1#2#3{#1 [Profession=#2] [Category=#3] \@ifnextchar[\@persBaux\relax}
\def\@persBaux[#1]{[#1]\@ifnextchar[\@persBBaux\relax}
\def\@persBBaux[#1]{\space [HDR=#1]}
\def\persInComposition#1#2#3{\\ #1 #2, #3 }
\let\pers\persA
\def\TeamHasHdr#1{}

\newenvironment{catperso}[1]%
  {\let\pers\persB
   \begin{itemize}\pagebreak[2]\item[]{\hspace*{-1cm}\bf #1}}%
  {\end{itemize}}
\let\glossaire\relax
\newenvironment{glossaire}{\par {\bf Glossary :}\nopagebreak}{\par}
\newcommand\glo[2]{\par {\bf #1} #2\par}
 \long\def\ra@inmargin#1{\small\leavevmode\kern-2cm{\bf debug : #1}}
\newenvironment{moreinfo}{\small\ifdebug\ra@inmargin{moreinfo\par}\fi\it}{}
\let\ps@plain\ps@empty
\let\abstract\relax
\let\endabstract\relax
\newenvironment{abstract}{\quotation
{\bf Abstract: \nopagebreak}\it}{\endquotation\par}
\newenvironment{body}{\par}{\par}
\def\RAlefthead#1{\def\ra@lefthead{#1}}
\def\RArighthead#1{\def\ra@righthead{#1}}
\RAlefthead{INRIA activity report 2018}
\RArighthead{ }
\global\let\@mkboth\@gobbletwo
\def \RAbibXXname {Major publications by the team in recent years}
\def \RAbibAAname {Books and Monographs}
\def \RAbibCCname {Doctoral dissertations and ``Habilitation'' theses}
\def \RAbibDDname {Articles in referred journals and book chapters}
\def \RAbibEEname {Publications in Conferences and Workshops}
\def \RAbibHHname {Internal Reports}
\def \RAbibJJname {Miscellaneous}
\let\RAsc\textsc
\newcounter{myenumi} \setcounter{myenumi}{0}
\newcommand{\etalchar}[1]{$^{#1}$}
\let\endthebibliography\endlist
\def\thebibliography#1[#2]{
   \subsection*{#2}{\markboth{}{}}
   \list { {[\arabic{myenumi}]}}
        {\settowidth\labelwidth{[#1]}
          \leftmargin\labelwidth   \advance\leftmargin\labelsep
          \@nmbrlisttrue\def\@listctr{myenumi}}
   \def\newblock{\hskip .11em plus.33em   minus.07em}
  \sloppy\clubpenalty10000\widowpenalty10000 \sfcode`\.=1000\relax}
\def\Url@xxdo{% style assignments for tt fonts or T1 encoding
 \def\UrlBreaks{\do\.\do\@\do\\\do\/\do\!\do\_\do\|\do\;\do\>\do\]%
   \do\)\do\,\do\?\do\'\do\+\do\=\catcode`\%=14 }%
 \def\UrlBigBreaks{\do\:\do@url@hyp}%
 \def\UrlNoBreaks{\do\(\do\[\do\{\do\<}% (unnecessary)
 \def\UrlSpecials{\do\ {\ }}%
 \def\UrlOrds{\do\*\do\-\do\~}}% any ordinary characters that aren't usually
\def\url@xxstyle{%
 \def\UrlFont{\ttfamily}\Url@xxdo
}
\def\ra@myuppercase#1{\uppercase{#1}}
\def\RAindex#1{\index{#1}#1}
\def\@lbibitem[#1]{\@bibitem}
\newcommand\moduleref{\@ifnextchar[\@xmoduleref\@moduleref}
\def\@xmoduleref[#1]#2#3#4{\def\@tempa{2018}\def\@tempb{#1}%
 \ifx\@tempb\@tempa \@moduleref{#2}{#3}{#4}%
 \else[projet~#2, ann^^e9e #1, section~#3\if @#4@\else, module~#4\fi]\fi}

\def\@tocrmarg{2.55em plus 1fil \relax}

\footbibliographystyle{rawebalpha}
\bibliographystyle{raweb}
\newcommand\@moduleref[3]{%
   \def\@tempa{#1}\ifx\@tempa\RAprojet
   \ref{#1@#2@#3}\else [project~#1, section~#2\if @#3@\else, module~#3\fi]\fi}
\newif\ifdebug \debugfalse
\newcommand\projet[3]{%
 \def\RAprojet{#1}%
 \lowercase{\edef\theprojet@low{#1}}%
 \ifx @#2@ \def\@theprojetspec{\theprojet@low}\else
    \def\@theprojetspec{#2} \fi
 \def\@theprojetlong{#3}}
\let\project\projet
\newcommand\theme[1]{\def\@thetheme{#1}}
\newcommand\typeprojet[1]{\@latex@error{Invalid command \string\typeprojet}\@ehc}
\def\@thetypeprojet{Project-Team}
\def\no@string{no}
\newcommand\isproject[1]{\def\tempa{#1}\ifx\tempa\no@string\gdef\@thetypeprojet{Team}\fi}

%\newcommand\URLorraine{Lorraine\UR@sep}
%\newcommand\URSophia{Sophia Antipolis\UR@sep}
%\newcommand\URRhoneAlpes{Rhone-Alpes\UR@sep}
%\newcommand\URRennes{Rennes\UR@sep}
%\newcommand\URRocquencourt{Rocquencourt\UR@sep}
%\newcommand\URFuturs{Futurs\UR@sep}

%AC : code repris de tralics 
\newcommand\RCBordeaux{\UR@{Bordeaux}{ -- Sud Ouest}}
\newcommand\RCLille{\UR@{Lille}{ -- Nord Europe}}
\newcommand\RCParis{\UR@{Paris}{ -- Rocquencourt}}
\newcommand\RCSaclay{\UR@{Saclay}{ -- \^Ile-de-France}}
\newcommand\RCGrenoble{\UR@{Grenoble}{ -- Rh\^one-Alpes}}
\newcommand\RCNancy{\UR@{Nancy}{ -- Grand Est}}
\newcommand\RCRennes{\UR@{Rennes}{ -- Bretagne Atlantique}}
\newcommand\RCSophia{\UR@{Sophia}{ Antipolis -- M\'editerran\'ee}}

\let\URSophia\RCSophia
\let\URLorraine\RCNancy
\let\URRennes\RCRennes
\let\URRhoneAlpes\RCGrenoble
\let\URRocq\RCParis
%% fin AC

\def\checklocalisation{
  \bgroup \def\URLorraine{1}\def\URSophia{1}\def\URRhoneAlpes{1}%
    \def\URRennes{1}\def\URRocquencourt{1}\def\URFuturs{1}
    \edef\foo{\@thelocalisation}
    \def\URone{1}\def\URtwo{11}
    \ifx\foo\URone\gdef\UR@sep{}\else\ifx\foo\URtwo\else 
        \error{Localisation incorrecte}\fi\fi
  \egroup
}
\def\checklocalisation{} % 2007 changes
\def\@thelocalisation{En France}
\newcommand\UR[1]{\def\@thelocalisation{#1}\checklocalisation}
\def\ps@ra{%
     \def\@oddhead{\vbox{\hbox to \textwidth{%
       \normalsize\rm \@thetypeprojet \space \@theprojetspec\hfil
version of \today
}}}
     \let\@evenhead\@oddhead
}\pagestyle{ra}
\projet{Noproject}{}{No project}
\theme{No theme}
\def\RAmysection{unknown}
\def\declaretopic#1#2{\@ifundefined{topic #1}{%
  \expandafter\gdef\csname topic #1\endcsname{#2}}
  {\par {\large\bf Topic #1 redefined\par}}}

\def\checktopic#1{\@ifundefined{topic #1}{\par {\large\bf Topic #1 undefined\par}}{}}



\newenvironment{module}[4][{}]{%
   \ifx @#1@ \else \checktopic{#1}\fi
   \ifx @#2@ \else \check@section{#2}\fi
   \ifx @#4@ \else \subsection{#4}\fi%
   \label{\RAprojet @\RAmysection @#3}%
   \leavevmode
   \ifdebug {\ra@inmargin{}
    Module named ``#3'' for the project \RAprojet, section \RAmysection 
     \ifx @#1@ \else, topic \csname topic #1\endcsname\fi\par}
   \fi
}{}

%% JPJ env composition 
\newenvironment{composition}{\let\pers\persInComposition
  \begin{module}{composition}{}{}{}\leavevmode\\\\\parbox{.8\textwidth}{\fbox{\textit{Preview team list: will be correctly formatted by} \textrm{\textsc{Irabot}}}}\\}
               {\end{module}}

%% AC Nov2018 : nouvel intitulé de la rubrique team/personnel
\def\sec@composition{Team, visitors, external collaborators}
\def\sec@presentation{Overall Objectives}
\def\sec@fondements{Scientific Foundations}
\def\sec@domaine{Application Domains}
\def\sec@logiciels{Software}
\def\sec@resultats{New Results}
\def\sec@contrats{Contracts and Grants with Industry}
\def\sec@international{Other Grants and Activities}

%%% jpj nouvelles sections ra2018
\def\sec@diffusion{Dissemination}
\def\sec@highlights{Highlights of the Year}
\def\sec@partenariat{Partnerships and Cooperations}
\def\XMLaddatt*#1#2{}
%%% end jpj

\def\sec@cooperations{\badsection}
\def\sec@formation{\badsection}
\def\sec@manifestations{\badsection}
\def\sec@conclusion{\badsection}
\def\warn@irabot{\\\parbox{.8\textwidth}{\fbox{\textbf{\textit{PREVIEW PDF: the final result will be build with \textsc{Irabot}}}}}}
\def\check@section#1{%
   \def\@tmpa{#1}%
   \ifx\RAmysection\@tmpa\else
      \@ifundefined{sec@#1}%
        {\global\def\RAmysection{presentation}%
         \def\realsec{\sec@presentation}%
         \@latex@error{Section name #1 invalid}\@ehc}%
        {\global\def\RAmysection{#1}%
         \def\realsec{\csname sec@#1\endcsname}}%
%% suppession label ..
%%   \section{\realsec}\label{\RAprojet @\RAmysection @}
     \section{\realsec}\fi}
\renewenvironment{body}{\par\ifdebug{\ra@inmargin{body of the module}.\par}\fi}{\par}
\let\@old@maketitle\maketitle
\def\maketitle{%
     \title{\@thetypeprojet: \@theprojetspec}\author{\@theprojetlong\\Theme
    \@thetheme\\\@thelocalisation\\\warn@irabot}%
     {\lccode`\_=`\_\lowercase{\footbibliography{\theprojet@low_foot2018}}}%
   \@old@maketitle
   \newpage
   \tableofcontents\clearpage}
\def\loadbiblio{%
   \section{Bibliography}%
   \immediate\openout15=\jobname.refer.aux\relax
   \immediate\write15{\string\bibstyle{rawebnum}}%
   \immediate\write15{\string\bibdata{\theprojet@low\string_refer2018}}%
   \immediate\write15{\string\citation{*}}%
   \immediate\closeout15
   \urlstyle{xx}%
    \let\bibitem\referbibitem
   \@input@{\jobname.refer.bbl}%
    \let\bibitem\yearbibitem
   \bibliography{\theprojet@low2018}}
\def\DeclareTextCompositeCommand#1#2#3#4{}
\def\aparaitre{to appear}
\let\toappear\aparaitre
\def\no{No}

\def\referbibitem{\@ifnextchar[\refer@lbibitem\refer@bibitem}
\def\refer@lbibitem[#1]#2{\item[\@biblabel{#1}\hfill]\if@filesw
      {\let\protect\noexpand
       \immediate
       \write\@auxout{\string\bibcite{refer#2}{#1}}}\fi\ignorespaces}
\def\refer@bibitem#1{\item\if@filesw \immediate\write\@auxout
       {\string\bibcite{refer#1}{\the\value{\@listctr}}}\fi\ignorespaces}

\let\yearbibitem\bibitem

%% a.c.  traitement des commandes bestcite et bestrefercite
\newcommand\bestcite[1]{BEST PAPER AWARD \newline
    \cite{#1}}
\newcommand\bestrefercite[1]{BEST PAPER AWARD \newline
    \refercite{#1}}

\DeclareRobustCommand\refercite{%
  \@ifnextchar [{\@tempswatrue\@citex}{\@tempswafalse\refer@citex[]}}
\def\refer@citex[#1]#2{\leavevmode
  \let\@citea\@empty
  \@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{,\penalty\@m\ }%
     \edef\@citeb{refer\expandafter\@firstofone\@citeb\@empty}%
     \if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi
     \@ifundefined{b@\@citeb}{\hbox{\reset@font\bfseries ?}%
       \G@refundefinedtrue
       \@latex@warning
         {Citation `\@citeb' on page \thepage \space undefined}}%
       {\@cite@ofmt{\csname b@\@citeb\endcsname}}}}{#1}}

\endinput

