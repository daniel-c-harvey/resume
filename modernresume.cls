% modernresume.cls - A modern resume document class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{modernresume}[Modern Resume Class]

% Base class
\LoadClass[10pt,letterpaper]{article}

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
\RequirePackage{lastpage}

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
\setlength{\footskip}{16pt}

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
        {\Large \@jobtitle} \\ \vspace{8pt}
        \small 
        \raisebox{-0.1\height}\faPhone\ \@phonenumber ~ 
        \href{mailto:\@emailaddress}{\raisebox{-0.2\height}\faEnvelope\ \@emailaddress} ~ 
        \href{https://github.com/\@githubhandle}{\raisebox{-0.2\height}\faGithub\ \@githubhandle} ~
    \end{center}
    \vspace{-16pt}
}

% Utility commands
\newcommand{\link}[2]{\href{#1}{\color{primary}#2}}
\newcommand{\githubrepo}[1]{\href{https://github.com/\@githubhandle/#1}{\faGithub\ \texttt{#1}}}

% Skills section
\newcommand{\skillsheader}[1]{
    \section{#1}
    \begin{itemize}[leftmargin=0in, label={}]
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

\newcommand{\role}[6]{
    \vspace{4pt}
    \begin{tabular*}{\textwidth}[t]{@{}l@{\extracolsep{\fill}}r@{}}
        {\large\textbf{#1}}\IfValueT{#2}{ \textit{\small[#2]}} & #3 \\
        \textit{#4} & \textit{#5} \\
    \end{tabular*}

    \IfValueT{#6}{
        \vspace{4pt}
        \textbf{Technologies:} #6
    }
    \vspace{4pt}
}

\newcommand{\product}[3]{
    \vspace{4pt}
    \textbf{Product: #1} \IfValueT{#2}{ \textit{\small[#2]}}
    
    \IfValueT{#3}{ 
        \vspace{2pt}
        #3
        \vspace{4pt}
    }
    \begin{itemize}
}

\newcommand{\achievement}[1]{
    \item \achievementformatfirstword#1\relax
}

% Helper command to make first word bold
\def\achievementformatfirstword#1 #2\relax{%
    \textbf{#1} #2%
}

\newcommand{\productend}{
    \end{itemize}
    \vspace{8pt}
}

% Projects section
\newcommand{\projectsheader}[1]{
    \section{#1}
    \vspace{-2pt}
}

\NewDocumentCommand{\project}{m m o o}{
    \vspace{8pt}
    \textbf{#1} \textbar\ \textit{#2}%
    \IfValueT{#3}{\ \textbar\ \githubrepo{#3}\IfValueT{#4}{\ \textbar\ }}%
    \IfValueT{#4}{\link{#4}{#4}}
    \vspace{2pt}
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
    \vspace{8pt}
    \textbf{#1}
    \vspace{4pt}
}

% Fields of study in columns
\newcommand{\studylist}[2][\numexpr2\relax]{
    \begin{minipage}[t]{\textwidth}
    \newcounter{colnum}
    \setcounter{colnum}{#1}
    \newlength{\colwidth}
    \setlength{\colwidth}{\dimexpr(\textwidth-\numexpr\value{colnum}-1\relax\tabcolsep*2)/\value{colnum}\relax}
    \begin{tabular*}{\textwidth}[t]{*{#1}{@{}p{\colwidth}@{}}}
    #2
    \end{tabular*}
    \end{minipage}
}

\newcommand{\study}[1]{
    \begin{center}
        \textbf{#1}
    \end{center}
    \vspace{-8pt}
    \begin{itemize}[leftmargin=0.25in, rightmargin=0.25in, nosep, itemsep=1pt]
}

\newcommand{\course}[2]{
    \item{{\small\textbf{#1}:} {\footnotesize#2}}
}

\newcommand{\studyend}{
    \end{itemize}
}

% Two-column convenience commands
\newcommand{\twostudylist}[2]{
    \begin{minipage}[t]{0.45\textwidth}
    #1
    \end{minipage}
    \hfill
    \begin{minipage}[t]{0.45\textwidth}
    #2
    \end{minipage}
}

\newcommand{\threestudylist}[3]{
    \begin{minipage}[t]{0.28\textwidth}
    #1
    \end{minipage}
    \hfill
    \begin{minipage}[t]{0.28\textwidth}
    #2
    \end{minipage}
    \hfill
    \begin{minipage}[t]{0.28\textwidth}
    #3
    \end{minipage}
}

% Remove paragraph indentation
\setlength{\parindent}{0pt}

% Footer
\fancyfoot[L]{\today}
\fancyfoot[C]{\@emailaddress}
\fancyfoot[R]{\thepage\ of \pageref{LastPage}}