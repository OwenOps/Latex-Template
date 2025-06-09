\LoadClass[a4paper,12pt]{article}

\RequirePackage{silence}
\WarningFilter{fancyhdr}{\headheight is too small}
\WarningFilter{fancyhdr}{\footskip is too small}

%--------------------------------------

\RequirePackage[english]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[section]{placeins}
\RequirePackage[T1]{fontenc}
\RequirePackage{xcolor}
\RequirePackage{biblatex}
\RequirePackage{ragged2e}
\RequirePackage{lipsum}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{amsmath} 
\RequirePackage{siunitx}
\RequirePackage{enumitem}
\RequirePackage{float}
\RequirePackage{graphicx}
\RequirePackage[justification=centering]{caption}
\RequirePackage{subcaption}
\RequirePackage{tikz}
\RequirePackage{fancyhdr}
\RequirePackage{url}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{geometry}
\geometry{left=2.5cm, right=2.5cm, top=2cm, bottom=5.5cm}
\RequirePackage{siunitx} 
\RequirePackage{tabularx}
\RequirePackage{microtype} 
\RequirePackage{pgfplots}
\RequirePackage{minted}
\RequirePackage[most, minted, breakable, skins, theorems]{tcolorbox}
\RequirePackage{csquotes}
\RequirePackage{eurosym}
\RequirePackage{svg}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{environ}
\RequirePackage{etoolbox}
\RequirePackage{seqsplit}
\RequirePackage{xparse}
\pgfplotsset{compat=1.18}

\usepackage{titlesec}

%--------------------------------------

\definecolor{bleu}{HTML}{03346E}
\definecolor{sectioncolor}{HTML}{1E3A8A}      
\definecolor{subsectioncolor}{HTML}{006400}   
\definecolor{subsubsectioncolor}{HTML}{444444} 

%--------------------------------------

\sisetup{output-decimal-marker = {,}} 
\renewcommand{\headrulewidth}{0pt} 
\setlength{\footskip}{4cm}  
\setlist[itemize]{label=\textbullet}
\setlist[itemize,2]{label=\textbf{--}}  

%--------------------------------------

\newcommand{\eleves}[1]{\renewcommand{\eleves}{#1}}
\newcommand{\titre}[1]{\renewcommand{\titre}{#1}}
\newcommand{\soustitre}[1]{\renewcommand{\soustitre}{#1}}

%--------------------------------------

% Titles
\usepackage{titlesec}

\titleformat{\section}
  {\normalfont\Large\bfseries\color{sectioncolor}}
  {\thesection}{1em}{}

\titleformat{\subsection}
  {\normalfont\large\bfseries\color{subsectioncolor}}
  {\thesubsection}{1em}{}

\titleformat{\subsubsection}
  {\normalfont\normalsize\bfseries\color{subsubsectioncolor}}
  {\thesubsubsection}{1em}{}


% Header And Footer
\pagestyle{fancy}
\fancyheadoffset{1cm}
\setlength{\headheight}{2.5cm}
\fancyhf{}
\fancyhead[L]{\hspace*{0.645cm}\includegraphics[height=2cm]{Images/latext_logo.png}}
\fancyfoot[R]{\textcolor{gray}{\textbf{\thepage}}}

\newcommand{\fairepagedegarde}{
    \rfoot{}
    \begin{centering}
    
        \vspace*{8cm}
        
        {\Huge \textbf{\textcolor{bleu}{\titre}} \par}
        
        \vspace{1cm}
        
        {\Large \textbf{\soustitre} \par}
    
        \vspace{2.5cm}
        
        \begin{minipage}{0.4\textwidth}
            \centering
            \large
            \emph{\textbf{Élèves :}}\\ 
            \eleves
        \end{minipage}
    
      
        \vfill
        
        {\large \today \par}
        
    \end{centering}
    \newpage
    
    \setcounter{page}{1}
    \rfoot{
      \raisebox{1.65cm}{ \makebox[0pt][c]{\hspace{-1.955cm}\textbf{\textcolor{black}{\thepage}}}}
      \hspace*{-0.67cm}
    }
}

%--------------------------------------

% Contents
\newcommand{\fairetabledesmatieres}{
    \tableofcontents
    \newpage
}

%--------------------------------------

% Insert a graphic
\newcommand{\insererfigure}[4]{
    \begin{figure}[H]
        \centering
        \includegraphics[width=#2]{#1}
        \caption{#3}
        \label{fig:#4}
    \end{figure}
}

%--------------------------------------

% Insert a bibliography
\newcommand{\insererbiblio}{
    \newpage
    \section{Bibliographie}
    \newrefcontext[sorting=none]
    \printbibliography[heading=none]
    \newpage
}

%--------------------------------------

% Style for code
\newtcblisting[auto counter]{codebox}[3][]{%
  enhanced,
  breakable,
  listing engine=minted,
  listing only,
  minted language=#3,
  minted options={
    fontsize=\small,
    breaklines,
    numbers=none,
    autogobble
  },
  title={
    \begin{tabular}{@{}m{0.80\linewidth}m{0.18\linewidth}@{}}
      {\bfseries\sffamily{Code \thetcbcounter\ : #2}} & \raggedleft \texttt{\small #3}
    \end{tabular}
  },
  label=#1,
  colback=bleu!7,
  colframe=bleu,
  fonttitle=\color{white},
  coltitle=white,
  boxrule=1.5pt,
  arc=2mm,
}


%--------------------------------------

% Définir un flag pour indiquer si nous sommes dans du code ou non
\newif\ifgenericboxresumed
\genericboxresumedfalse

% Définir genericenvironment
\NewDocumentCommand{\genericenvironment}{O{Problème} m m}{%
  \begin{tcolorbox}[
    enhanced,
    breakable,
    colback = white,
    colbacktitle = centrale_red!0,
    coltitle = centrale_red,
    boxrule = 0pt,
    frame hidden,
    borderline west = {0.5mm}{0.0mm}{centrale_red},
    fonttitle = \bfseries\sffamily,
    before skip = 3ex,
    after skip = 3ex,
    title = {\ifgenericboxresumed\else#1~#2\ifstrempty{#3}{}{~: #3}\fi},
    parbox=false,
    before upper={%
        \setlength{\parindent}{2em}%
        \setlength{\parskip}{1ex plus 0.5ex minus 0.2ex}%  
    },
  ]
}
\NewDocumentCommand{\endgenericenvironment}{}{%
  \end{tcolorbox}
}

% Pour stocker les valeurs d'affichage des références
\newcommand{\genericboxreftext}[2]{%
  \expandafter\gdef\csname genericboxreftext@#1\endcsname{#2}%
}

% Redéfinir \@setref pour utiliser les valeurs stockées si disponibles
\makeatletter
\let\original@setref\@setref
\def\@setref#1#2#3{%
  \ifcsname genericboxreftext@#3\endcsname
    \hyperref[#3]{\csname genericboxreftext@#3\endcsname}%
  \else
    \original@setref{#1}{#2}{#3}%
  \fi
}
\makeatother