% modernresume.cls - A modern resume document class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{modernresume}[Modern Resume Class]

% Base class
\LoadClass[11pt,letterpaper]{article}

% Required packages
\RequirePackage[empty]{fullpage}
\RequirePackage{titlesec}
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage{enumitem}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{fancyhdr}
\RequirePackage{tabularx}
\RequirePackage{fontawesome5}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{lmodern}
\RequirePackage{geometry}
\RequirePackage{xparse}

% Page setup
\geometry{
    left=0.5in,
    right=0.5in,
    top=0.5in,
    bottom=0.5in
}

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Colors
\definecolor{primary}{RGB}{0, 102, 204}
\definecolor{secondary}{RGB}{108, 117, 125}
\definecolor{accent}{RGB}{40, 167, 69}

% Section formatting
\titleformat{\section}{
  \vspace{-4pt}\raggedright\Large\scshape\color{primary}
}{}{0em}{}[\color{primary}\titlerule \vspace{-2pt}]

% List formatting
\setlist[itemize]{leftmargin=0.15in, nosep, itemsep=3pt, parsep=2pt}

% Personal information storage
\newcommand{\@fullname}{}
\newcommand{\@jobtitle}{}
\newcommand{\@phonenumber}{}
\newcommand{\@emailaddress}{}
\newcommand{\@githubhandle}{}
\newcommand{\@birthdate}{}

% Commands to set personal information
\newcommand{\fullname}[1]{\renewcommand{\@fullname}{#1}}
\newcommand{\jobtitle}[1]{\renewcommand{\@jobtitle}{#1}}
\newcommand{\phone}[1]{\renewcommand{\@phonenumber}{#1}}
\newcommand{\email}[1]{\renewcommand{\@emailaddress}{#1}}
\newcommand{\github}[1]{\renewcommand{\@githubhandle}{#1}}

% Header generation
\newcommand{\makeheader}{
    \begin{center}
        {\Huge \bfseries \@fullname} \\ \vspace{4pt}
        {\Large \@jobtitle} \\ \vspace{12pt}
        \small 
        \raisebox{-0.1\height}\faPhone\ \@phonenumber ~ 
        \href{mailto:\@emailaddress}{\raisebox{-0.2\height}\faEnvelope\ \@emailaddress} ~ 
        \href{https://github.com/\@githubhandle}{\raisebox{-0.2\height}\faGithub\ \@githubhandle} ~
    \end{center}
    \vspace{-8pt}
}

% Skills section
\newcommand{\skillsheader}[1]{
    \section{#1}
    \begin{itemize}[leftmargin=0.15in, label={}]
}

\newcommand{\skillsitem}[2]{
    \item{\textbf{#1}: #2}
}

\newcommand{\skillsfooter}{
    \end{itemize}
    \vspace{2pt}
}

% Experience section
\newcommand{\experienceheader}[1]{
    \section{#1}
}

\newcommand{\role}[5]{
    \vspace{8pt}
    \begin{tabular*}{\textwidth}[t]{@{}l@{\extracolsep{\fill}}r@{}}
        {\large\textbf{#1}} & #2 \\
        \textit{#3} & \textit{#4} \\
    \end{tabular*}
    \vspace{1pt}
    
    \IfValueT{#5}{
        \textbf{Technologies:} #5
        \vspace{4pt}
    }
}

\newcommand{\product}[1]{
    \textbf{Product: #1}
    \begin{itemize}
}

\newcommand{\achievement}[1]{
    \item #1
}

\newcommand{\productend}{
    \end{itemize}
    \vspace{1pt}
}

% Projects section
\newcommand{\projectsheader}[1]{
    \section{#1}
    \vspace{-2pt}
}

\newcommand{\project}[3]{
    \vspace{8pt}
    \textbf{#1} \textbar\ \textit{#2}
    \ifx&#3&%
    \else
        \ \textbar\ \href{#3}{\color{primary}#3}
    \fi
    \vspace{-1pt}
    \begin{itemize}
}

\newcommand{\projectend}{
    \end{itemize}
    \vspace{2pt}
}

% Education section
\newcommand{\educationheader}[1]{
    \section{#1}
    \vspace{4pt}
}

\newcommand{\degree}[4]{
    \vspace{2pt}
    \begin{tabular*}{\textwidth}[t]{@{}l@{\extracolsep{\fill}}r@{}}
        {\large\textbf{#1}} & \textbf{#2} \\
        \textit{#3} & \textit{#4} \\
    \end{tabular*}
    \vspace{2pt}
}

\newcommand{\thesis}[1]{
    \vspace{2pt}
    \textbf{Undergraduate Thesis:} \textit{#1}
    \vspace{2pt}
}

% Coursework subsection
\newcommand{\courseworkheader}[1]{
    \vspace{6pt}
    {\large\textbf{#1}}
    \vspace{2pt}
    \begin{itemize}[leftmargin=0.15in, label={}]
}

\newcommand{\course}[2]{
    \item{\textbf{#1}: {\small#2}}
}

\newcommand{\courseworkfooter}{
    \end{itemize}
    \vspace{2pt}
}

% Utility commands
\newcommand{\link}[2]{\href{#1}{\color{primary}#2}}
\newcommand{\githubrepo}[1]{\texttt{#1}}

% Remove paragraph indentation
\setlength{\parindent}{0pt}