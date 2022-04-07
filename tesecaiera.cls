\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tesecaieira}[2022/03/24 Classe de Tese de Doutorado do Caio]

% Formato ABNT de página A4 como padrão
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax

\LoadClass[a4paper, 12pt, twoside, openright]{memoir}
\setlrmarginsandblock{3cm}{2cm}{*}
\setulmarginsandblock{3cm}{2cm}{*}
\checkandfixthelayout%
\OnehalfSpacing%

% Dependências
\RequirePackage{indentfirst}
\RequirePackage{fontspec}
\RequirePackage{ragged2e}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{xltxtra}
\RequirePackage[pdfusetitle]{hyperref}

% Paleta de cores
\definecolor{green}{RGB}{16,87,87} % rgb(16,87,87)
\definecolor{red}{RGB}{193, 11, 105} % rgb(193, 11, 105)
\definecolor{yellow}{RGB}{218,222,104} % rgb(218,222,104)
\definecolor{pink}{RGB}{243,179,145} % rgb(243,179,145)
\definecolor{blue}{RGB}{161,184,206} % rgb(161,184,206)

% Decorando páginas
\makeoddfoot  {plain}{}{}{\thepage}
\makeevenfoot {plain}{\thepage}{}{}
\makepagestyle{ruled}
\makeevenfoot {ruled}{\thepage}{}{} % page numbers at the outside
\makeoddfoot  {ruled}{}{}{\thepage}
\makeheadrule {ruled}{\textwidth}{0.75pt}
\makeevenhead {ruled}{\scshape\leftmark}{}{}
\makeoddhead  {ruled}{}{}{\scshape\rightmark}
\makepsmarks  {ruled}{%
        \nouppercaseheads
        \createmark{chapter}{left}{shownumber}{\scshape}{.\space}
        \createmark{part}{right}{shownumber}{}{.\space}
        \createmark{section}{right}{shownumber}{}{.\space}
        \createmark{subsection}{right}{shownumber}{}{.\space}
        \createplainmark{toc}{both}{\contentsname}
        \createplainmark{lof}{both}{\listfigurename}
        \createplainmark{lot}{both}{\listtablename}
        \createplainmark{bib}{both}{\bibname}
        \createplainmark{index}{both}{\indexname}
        \createplainmark{glossary}{both}{\glossaryname}
}

% Decorando divisões
\chapterstyle{southall}
\setsecnumdepth{subsection}
\setcounter{tocdepth}{3}

% Decorando bibliografia
\RequirePackage[backend=biber, style=abnt, 
                autolang=hyphen, language=auto,
                pretty, repeatfields, noslsn,
                natbib, extrayear]{biblatex}


% Fontes, línguas, unicode
\RequirePackage[greek,latin,german,main=brazil]{babel}
\babelprovide[import=grc]{ancientgreek}
\setmainfont{Gentium Plus}
\setmonofont{Noto Sans Mono}

% Configurações para o autoref
\renewcommand{\figureautorefname}{Figura}
\renewcommand{\tableautorefname}{Tabela}
\renewcommand{\sectionautorefname}{Seção}
\renewcommand{\chapterautorefname}{Capítulo}
\renewcommand{\subsectionautorefname}{Subseção}


% Páginas especiais
\newlength{\linespace}
\setlength{\linespace}{\baselineskip} % current equivalent of \onelineskip
\setlength{\headheight}{\onelineskip}
\setlength{\headsep}{\linespace}
\addtolength{\headsep}{-\topskip}
\setlength{\uppermargin}{1in}
\addtolength{\uppermargin}{\headheight}
\addtolength{\uppermargin}{\headsep}
\setlength{\lowermargin}{1in}
\setlength{\textheight}{\paperheight}
\addtolength{\textheight}{-\uppermargin}
\addtolength{\textheight}{-\lowermargin}
\setlength{\footskip}{\onelineskip}
\setlength{\footnotesep}{\onelineskip}
\newlength{\toptafiddle} \setlength{\toptafiddle}{2\linespace}
\newlength{\bottafiddle} \setlength{\bottafiddle}{0pt}
\newlength{\topfiddle}
\setlength{\topfiddle}{\toptafiddle}
\newlength{\botfiddle}
\setlength{\botfiddle}{\onelineskip}

% Variáveis
% Comandos de dados - titulo do documento
\newcommand{\titulo}[1]{\title{#1}}
\newcommand{\imprimirtitulo}{\thetitle}

% Comandos de dados - titulo do documento
\providecommand{\theforeigntitle}[1]{}
\newcommand{\tituloestrangeiro}[1]{\renewcommand{\theforeigntitle}{#1}}
\newcommand{\imprimirtituloestrangeiro}{\theforeigntitle}

% Comandos de dados - autor (use \and para multiplos autores)
\newcommand{\autor}[1]{\author{#1}}
\newcommand{\imprimirautor}{\@author}

% Comandos de dados - data
\let\olddate\date
\renewcommand{\date}[1]{\AtBeginDocument{\olddate{#1}}}
\newcommand{\data}[1]{\date{#1}}
\newcommand{\imprimirdata}{\thedate}

% Comandos de dados - local
\providecommand{\imprimirlocal}{}
\newcommand{\local}[1]{\renewcommand{\imprimirlocal}{#1}}

% Universidade
\providecommand{\imprimiruniversidade}{}
\newcommand{\universidade}[1]{%
    \renewcommand{\imprimiruniversidade}{#1}
}

% Faculdade
\providecommand{\imprimirfaculdade}{}
\newcommand{\faculdade}[1]{%
    \renewcommand{\imprimirfaculdade}{#1}
}

% Programa
\providecommand{\imprimirprograma}{}
\newcommand{\programa}[1]{%
    \renewcommand{\imprimirprograma}{#1}
}

% subtitulo
\providecommand{\imprimirsubtitulo}{}
\newcommand{\subtitulo}[1]{%
    \renewcommand{\imprimirsubtitulo}{#1}
}

% versao
\providecommand{\imprimirversao}{}
\newcommand{\versao}[1]{%
    \renewcommand{\imprimirversao}{#1}
}

% titulacao
\providecommand{\imprimirtitulacao}{}
\newcommand{\titulacao}[1]{%
    \renewcommand{\imprimirtitulacao}{#1}
}

\providecommand{\imprimirbancaA}{}
\providecommand{\imprimirbancaATitulo}{}
\providecommand{\imprimirbancaAInstituicao}{}
\newcommand{\bancaA}[3]{
    \renewcommand{\imprimirbancaATitulo}{#1}
    \renewcommand{\imprimirbancaA}{#2}
    \renewcommand{\imprimirbancaAInstituicao}{#3}
}

\providecommand{\imprimirbancaB}{}
\providecommand{\imprimirbancaBTitulo}{}
\providecommand{\imprimirbancaBInstituicao}{}
\newcommand{\bancaB}[3]{
    \renewcommand{\imprimirbancaBTitulo}{#1}
    \renewcommand{\imprimirbancaB}{#2}
    \renewcommand{\imprimirbancaBInstituicao}{#3}
}

\providecommand{\imprimirbancaC}{}
\providecommand{\imprimirbancaCTitulo}{}
\providecommand{\imprimirbancaCInstituicao}{}
\newcommand{\bancaC}[3]{
    \renewcommand{\imprimirbancaCTitulo}{#1}
    \renewcommand{\imprimirbancaC}{#2}
    \renewcommand{\imprimirbancaCInstituicao}{#3}
}

\providecommand{\imprimirorientador}{}
\providecommand{\imprimirorientadorTitulo}{}
\providecommand{\imprimirorientadorInstituicao}{}
\newcommand{\orientador}[3]{
    \renewcommand{\imprimirorientadorTitulo}{#1}
    \renewcommand{\imprimirorientador}{#2}
    \renewcommand{\imprimirorientadorInstituicao}{#3}
}

\providecommand{\imprimirdataDefesa}{}
\newcommand{\dataDefesa}[1]{
    \renewcommand{\imprimirdataDefesa}{#1}
}

% Comandos de dados - tipo de trabalho
\providecommand{\imprimirtipotrabalho}{}
\newcommand{\tipotrabalho}[1]{\renewcommand{\imprimirtipotrabalho}{#1}}

\newcommand{\capa}{
    {%
        \clearpage
        \thispagestyle{empty}
        \centering
        \vspace*{-\toptafiddle}
        {\bfseries\scshape\large
        \imprimiruniversidade\par
        \imprimirfaculdade\par
        \imprimirprograma
    \par
    }

    \vspace{6cm}
    {\large \imprimirautor}\par
    \vspace{2cm}
    {\Large \imprimirtitulo}\par
    {\large \imprimirsubtitulo}\par
    \vspace{1cm}

    \textbf{Versão \imprimirversao}
    \vfill
    {\large\bfseries\scshape
    \imprimirlocal\par
    \imprimirdata
    \par}
    \enlargethispage{\bottafiddle}
    \clearpage
}}

\newcommand{\gerardescricao}[0]{%
    \begin{minipage}{.5\textwidth}\SingleSpacing
    \imprimirtipotrabalho{} apresentado ao \imprimirprograma{} da
    \imprimirfaculdade{},
    \imprimiruniversidade{}, como exigência parcial para
    a obtenção do título de \imprimirtitulacao{}.
    \par
    \vspace{1em}
    Orientador: \imprimirorientador
    \par
    \end{minipage} }

\newcommand{\folhaderosto}{
    {%
        \cleardoublepage
        \thispagestyle{empty}
        \centering
        \vspace*{-\toptafiddle}
        {\bfseries\scshape\large
        \imprimirautor
        \par
    }

    \vspace{9cm}
    {\Large \imprimirtitulo}\\
    {\large \imprimirsubtitulo}\par
    \vspace{1cm}
    {\bfseries Versão \imprimirversao}\\
    \vfill

    {\hspace{.45\textwidth}
        \gerardescricao{}
    }
    \vfill
    {\large\bfseries\scshape
    \imprimirlocal\\
    \imprimirdata
    \par}
    \enlargethispage{\bottafiddle}
    \clearpage}
}


\newcommand{\folhaaprovacao}{
    {%
    \clearpage
    \thispagestyle{empty}
    \centering
    \vspace*{-\toptafiddle}
    {\bfseries\scshape\large
        \imprimirautor
    \par
    }

    \vspace{2cm}
    {\Large \imprimirtitulo}\\
    {\large \imprimirsubtitulo}\par
    \vspace{1cm}
    {\hspace{.45\textwidth}
        \gerardescricao{}
    \vfill

    Trabalho aprovado. \imprimirlocal, \imprimirdataDefesa{}.\\

    \assinatura{\textbf{\imprimirorientadorTitulo{} \imprimirorientador{}} \\ Orientador{}}
    \assinatura{\textbf{\imprimirbancaATitulo{} \imprimirbancaA{}} \\ \imprimirbancaAInstituicao{}}
    \assinatura{\textbf{\imprimirbancaBTitulo{} \imprimirbancaB{}} \\ \imprimirbancaBInstituicao{}}
    \assinatura{\textbf{\imprimirbancaCTitulo{} \imprimirbancaC{}} \\ \imprimirbancaCInstituicao{}}
    }

    \vfill
    {\large\bfseries\scshape
    \imprimirlocal
    \par
    \imprimirdata
    \par}
    \enlargethispage{\bottafiddle}
    \clearpage}
}

\newcommand{\colofao}[0]{
    \cleardoublepage
    \pagestyle{empty}
    \cleartoevenpage
    \hfill
    \vfill
        \begin{adjustwidth}{8.5em}{8.5em}
            \begin{Center}
            \textbf{Colofão}\par
            Esse documento foi diagramado usando o sistema \href{https://lualatex.org}{Lua\TeX} mantido por Manuel Pégourié-Gonnard. Todos os \emph{softwares} utilizados na diagramação deste trabalho são gratuitos e \emph{open source}.\par
            {\today.}
            \end{Center}
        \end{adjustwidth}
    \bigskip
    \noindent
}

% Macro para gráficos duplos

\newcommand{\figdupla}[4]{
        \begin{figure}[!ht]
        \begin{minipage}[b]{0.42\linewidth}
          \begin{center}
            \includegraphics[width=1\linewidth]{./figs/#1}
          \end{center}
          \caption{#2}\label{fig:#1}
        \end{minipage}
        \hspace{0.1\linewidth}
        \begin{minipage}[b]{0.42\linewidth}
          \begin{center}
            \includegraphics[width=1\linewidth]{./figs/#3}
          \end{center}
          \caption{#4}\label{fig:dialeto}
        \end{minipage}
        \end{figure}
}

% Ferramentas
\hypersetup{%
        colorlinks=true, % false: boxed links; true: colored links
        linkcolor=green,  % color of internal links
        citecolor=green,  % color of links to bibliography
        filecolor=pink,  % color of file links
        urlcolor=green,
        bookmarksdepth=4
}
