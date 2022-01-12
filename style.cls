\ProvidesClass{resume}[]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\usepackage{ulem}
\RequirePackage{xcolor}

\definecolor{white}{HTML}{FFFFFF}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{888888}
\definecolor{taggray}{HTML}{EEEEEE}
\definecolor{headercolor}{HTML}{222222}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage{unicode-math}

\newfontfamily\bodyfont[]{Helvetica Neue}
\newfontfamily\thinfont[]{Helvetica Neue UltraLight}
\newfontfamily\headingfont[]{Helvetica Neue Condensed Bold}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Helvetica Neue Light}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=darkgray, anchor=north, minimum width=\paperwidth, minimum height=3.5cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{32pt}{64pt}\color{white}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{white}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%

\def\@sectioncolor{%
  {\color{headercolor}}
}

\RequirePackage{parskip}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {\Large\headingfont\color{headercolor} #1}
  \par\vspace{.25\parskip}%
}

\renewcommand{\subsubsection}[2]{
  \par\vspace{.5\parskip}%
  {\Large\headingfont\color{headercolor} #2}
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}

%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  \parbox[t]{14cm}{%
    \textbf{#1}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #2}\\%
    #3\vspace{\parsep}%
  }\\}

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}%
    \vspace{1mm}
  }
  \begin{textblock}{4.2}(0.8, 5.6)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%
% Tags %
%%%%%%%%

\usepackage{tikz}

\newcommand{\tile}[1]{
\begin{tikzpicture}%
	\node[draw = taggray, fill = taggray, rectangle, rounded corners, text = black](char){\footnotesize{#1\vphantom{j}}};
\end{tikzpicture}
\hspace{-2.5mm}
}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6cm,top=2cm,right=1.3cm,bottom=0cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
\hypersetup{colorlinks=false}
\renewcommand{\url}[2]{\color{lightgray}\uline{\color{black}\href{#1}{#2}}\color{black}}
    
% A fix for \href{}{} colors not working with fontspec
\makeatletter
\def\HyColor@@@@UseColor#1\@nil{\addfontfeatures{Color=#1}}
\makeatother