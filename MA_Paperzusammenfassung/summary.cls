%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Summary Database latex class 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{summary}[2008/02/05  SummaryDB IfP Oldenburg]


\pagestyle{empty}

\LoadClassWithOptions{article}
\RequirePackage[a4paper,left=2.5cm,top=2.5cm,bottom=2cm,right=2cm,nohead,nofoot]{geometry} 

\RequirePackage{amsmath}
\RequirePackage{times}
\RequirePackage{epsfig}
\RequirePackage{ifthen}
\RequirePackage{graphicx}
\RequirePackage{ngerman}
\RequirePackage{a4}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage[latin1]{inputenc}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Counters for authors and editors 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{sum@NumAuthors}
\newcounter{sum@loopauthors}
\newcounter{sum@NumEditors}
\newcounter{sum@loopeditors}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Parse options: maybe we find a better solution
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{sum@type}

\setcounter{sum@type}{0}
\DeclareOption{article}{       \setcounter{sum@type}{1} }
\DeclareOption{report}{        \setcounter{sum@type}{2} }
\DeclareOption{proceedings}{   \setcounter{sum@type}{3} }
\DeclareOption{review}{        \setcounter{sum@type}{4} }
\ProcessOptions\relax

\ifnum\value{sum@type}=0\relax
    \ClassError{summary}{Please provide a class option:\MessageBreak
    \ documentclass[article]{summary}  \MessageBreak
    \ documentclass[report]{summary}   \MessageBreak
    \ documentclass[proceedings]{summary}  \MessageBreak
    \ documentclass[review]{summary}  \MessageBreak}
	     {Please provide a class option:\MessageBreak
	       \ documentclass[article]{summary}  \MessageBreak
	       \ documentclass[report]{summary}   \MessageBreak
	       \ documentclass[proceedings]{summary}  \MessageBreak
	       \ documentclass[review]{summary}  \MessageBreak}
\fi 





\pagestyle{empty}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% unset macros 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\global\let\@title\@empty
\global\let\title\relax

\global\let\@booktitle\@empty
\global\let\booktitle\relax


\global\let\@author\@empty
\global\let\author\relax

\global\let\@journal\@empty
\global\let\journal\relax

\global\let\@volume\@empty
\global\let\volume\relax

\global\let\@pages\@empty
\global\let\pages\relax

\global\let\@year\@empty
\global\let\year\relax

\global\let\@editor\@empty
\global\let\editor\relax

\global\let\@no\@empty
\global\let\no\relax

\global\let\@pacs\@empty
\global\let\pacs\relax

\global\let\@cat\@empty
\global\let\cat\relax

\global\let\@doi\@empty
\global\let\doi\relax

\global\let\@id\@empty
\global\let\id\relax


%\global\let\@sumcat\@empty
%\global\let\sumcat\relax

%\global\let\@sumdoi\@empty
%\global\let\sumdoi\relax

%\global\let\@sumid\@empty
%\global\let\sumid\relax

\global\let\@institution\@empty
\global\let\institution\relax

\newcommand\author[1]{%
  \stepcounter{sum@NumAuthors}%
  \global\@namedef{sum@Author\Roman{sum@NumAuthors}}{ #1 }}

\newcommand\editor[1]{%
  \stepcounter{sum@NumEditors}%
  \global\@namedef{sum@Editors\Roman{sum@NumEditors}}{ #1 }}


\newcommand{\link}[2][\empty]{
  \ifthenelse{\equal{#1}{\empty}}
    {\underline{#2}}
    {\underline{#1}}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Display authors (and separated)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\showauthors{
  \setcounter{sum@loopauthors}{0}%
  \loop
     \stepcounter{sum@loopauthors}%
     \ifnum\value{sum@loopauthors}>1\relax
         \ifnum\value{sum@loopauthors}=\value{sum@NumAuthors}\relax
             \ifnum\value{sum@NumAuthors}>2\relax
		  {, and }%
              \else
	  	  { and }%
              \fi
         \else
           {, }%
	 \fi
    \fi
    \textsc{\@nameuse{sum@Author\Roman{sum@loopauthors}}}%
    \ifnum\value{sum@loopauthors}<\value{sum@NumAuthors}\relax
  \repeat
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Display editors (and separated)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\showeditors{
  \setcounter{sum@loopeditors}{0}%
  \loop
     \stepcounter{sum@loopeditors}%
     \ifnum\value{sum@loopeditors}>1\relax
         \ifnum\value{sum@loopeditors}=\value{sum@NumEditors}\relax
             \ifnum\value{sum@NumEditors}>2\relax
		  {, and }%
              \else
	  	  { and }%
              \fi
         \else
           {, }%
	 \fi
    \fi
    \textsc{\@nameuse{sum@Editors\Roman{sum@loopeditors}}}%
    \ifnum\value{sum@loopeditors}<\value{sum@NumEditors}\relax
  \repeat
}


  


\newcommand\@sumno{}{}
\newcommand\@suminstitution{}{}
\newcommand\@sumcat{}{}
\newcommand\@sumdoi{}{}
\newcommand\@sumpacs{}{}
\newcommand\@sumid{}{}

\newcommand\pacs[1]{ \renewcommand\@sumpacs{#1} }
\newcommand\cat[1]{ \renewcommand\@sumcat{#1} }
\newcommand\doi[1]{ \renewcommand\@sumdoi{#1} }
\newcommand\id[1]{ \renewcommand\@sumid{#1} }
\newcommand\title[1]{ \newcommand\@sumtitle{#1} }
\newcommand\booktitle[1]{ \newcommand\@sumbooktitle{#1} }
\newcommand\journal[1]{ \newcommand\@sumjournal{#1} }
\newcommand\volume[1]{ \newcommand\@sumvolume{#1} }
\newcommand\pages[1]{ \newcommand\@sumpages{#1} }
\newcommand\year[1]{ \newcommand\@sumyear{#1} }
\newcommand\no[1]{ 
  \ifnum\value{sum@type}=1\relax
     \renewcommand\@sumno{(#1)} 
  \else 
      \renewcommand\@sumno{report~number:~{\bf~#1} } 
  \fi
}
\newcommand\institution[1]{ \renewcommand\@suminstitution{#1} }



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Document type 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\renewcommand{\maketitle}{
  % Article 
  \ifnum\value{sum@type}=1\relax
     \begin{center}\huge {\@sumtitle   } \end{center}  
     \begin{center} \Large{ \showauthors } \end{center}
    \begin{center} \large{ \@sumjournal\;{ \bf \@sumvolume } \@sumno, \@sumpages\;(\@sumyear).} \end{center}  
  \fi 

  % Report 
  \ifnum\value{sum@type}=2\relax
    \begin{center}\huge {\@sumtitle   } \end{center}  
    \begin{center} \Large{ \showauthors } \end{center}
    \begin{center} \large{ \@suminstitution\;   \@sumno\,(\@sumyear).} \end{center}  
  \fi 

  % Proceedings 
  \ifnum\value{sum@type}=3\relax
    \begin{center}\huge {\@sumtitle   } \end{center}  
    \begin{center} \Large{ \showauthors } \end{center}
    \begin{center} \large{ \@sumbooktitle {, pp \@sumpages }  (\@sumyear).} \end{center}  
    \begin{center} \large{ Eds.: \showeditors } \end{center}
  \fi 

  % Review
  \ifnum\value{sum@type}=4\relax
    \begin{center}\huge {\@sumtitle   } \end{center}  
  \fi 

  \begin{tabular}{l|l|l|l}
    pacs & 
    category  & 
    doi & 
    id \\
    \hline
    \@sumpacs & 
    \@sumcat &
    \@sumdoi & 
    \@sumid
  \end{tabular}
}




% SECTIONS
% make all section, subsection, subsub... run-in headings and no numberbering
\setcounter{secnumdepth}{-2}




%\sloppy




