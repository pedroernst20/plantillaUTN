% plantillautn.cls ^-^
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{plantillautn}[2025/04/06 Clase para informes UTN]

\newif\ifchaptersright
\chaptersrightfalse

\DeclareOption{chaptersright}{\chaptersrighttrue}

\ExecuteOptions{}
\ProcessOptions\relax

\ifchaptersright
  \LoadClass[12pt,openright,twoside]{report}
\else
  \LoadClass[12pt,openany]{report}
\fi

% --- Paquetes esenciales ---
\RequirePackage{emptypage}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[spanish]{babel}
\RequirePackage{graphicx}
\RequirePackage{amsmath, amssymb, amsfonts}
\RequirePackage{xfrac}
\RequirePackage{float}
\RequirePackage{enumitem}
\RequirePackage{booktabs}
\RequirePackage{indentfirst}
\RequirePackage{tikz}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{geometry}
\RequirePackage{afterpage}
\RequirePackage{etoolbox}
\RequirePackage{hyperref}
\RequirePackage[siunitx]{circuitikz}

% --- Márgenes ---
\geometry{
  left=2.5cm, right=2.5cm,
  top=2cm, bottom=2cm,
  includehead
}

% --- Encabezado y pie de página ---
\pagestyle{fancy}
\fancyhf{}
\lhead{UTN}
\rhead{\@materia}
\cfoot{\thepage}
\setlength{\headheight}{15pt}
\setlength{\headsep}{20pt}
\setlength{\headwidth}{\textwidth}

% --- Comandos personalizados ---
\makeatletter
\newcommand{\materia}[1]{\def\@materia{#1}}
\newcommand{\titulo}[1]{\def\@titulo{#1}}
\newcommand{\subtitulo}[1]{\def\@subtitulo{#1}}
\newcommand{\profesores}[1]{\def\@profesores{#1}}
\newcommand{\autores}[1]{\def\@autores{#1}}
\newcommand{\fecha}[1]{\def\@fecha{#1}}

% --- Unidades útiles ---
\newcommand{\kohm}{\,\mathrm{k}\Omega}
\newcommand{\Mohm}{\,\mathrm{M}\Omega}
\newcommand{\nF}{\,\mathrm{nF}}
\newcommand{\uF}{\,\mathrm{\mu F}}
\newcommand{\mF}{\,\mathrm{mF}}
\newcommand{\mV}{\,\mathrm{mV}}
\newcommand{\V}{\,\mathrm{V}}
\newcommand{\kV}{\,\mathrm{kV}}
\newcommand{\uA}{\,\mathrm{\mu A}}
\newcommand{\mA}{\,\mathrm{mA}}
\newcommand{\A}{\,\mathrm{A}}
\newcommand{\mH}{\,\mathrm{mH}}
\newcommand{\uH}{\,\mathrm{\mu H}}
\newcommand{\nH}{\,\mathrm{nH}}

% --- Estilo de capítulos y secciones ---
\titleformat{\chapter}[hang]{\normalfont\LARGE\bfseries}{}{0pt}{}
\titlespacing*{\chapter}{10pt}{0pt}{20pt}
\patchcmd{\chapter}{\thispagestyle{plain}}{\thispagestyle{fancy}}{}{}

\titleformat{\section}{\normalfont\Large\bfseries}{}{0pt}{}
\titlespacing*{\section}{12pt}{18pt plus 2pt minus 2pt}{8pt}

\titleformat{\subsection}{\normalfont\large\bfseries}{}{0pt}{}
\titlespacing*{\subsection}{15pt}{12pt plus 1pt minus 1pt}{6pt}

% --- Índice ---
\renewcommand{\contentsname}{Tabla de Contenidos}

% --- Carátula automática ---
\renewcommand{\maketitle}{%
  \begin{titlepage}
    \centering
    \vspace*{1cm}
    \includegraphics[width=0.30\textwidth]{logo_utn.png}\\[1cm]
    {\Huge \textbf{Universidad Tecnológica Nacional} \\
    Facultad Regional Córdoba \par}
    \vspace{2cm}
    {\Huge \bfseries \@titulo \par}
    {\Large \@subtitulo \par}
    \vspace{1.5cm}
    {\LARGE \@materia \par}
    \vfill
    {\Large \@autores \par}
    \vspace{1cm}
    {\Large Fecha de entrega: \@fecha \par}
  \end{titlepage}%
}