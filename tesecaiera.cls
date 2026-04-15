% Este template foi desenvolvido para a diagramação de teses de doutorado
% seguindo as normas ABNT, com inclusão de diversos pacotes e macros preparados
% especificamente para a diagramação de teses nas áreas de linguística e estudos
% clássicos. Decisões estéticas de cunho pessoal foram tomadas e podem ser
% facilmente modificadas para acomodar as preferências da autora/do autor e de
% sua instituição. Diversos `avisos' são produzidos, sobretudo por conta dos
% pacotes `microtype' e `datatool'. Por motivos técnicos, este template não
% funciona de maneira fácil no OverLeaf (sobretudo por conta das fontes
% personalizadas).
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tesecaiera}[2026-04-15 Classe de Tese de Doutorado por Caio Geraldes]

% BEGIN: OPÇÕES
\newcommand{\selection}{selection={recorded and deps and see}}
\newcommand{\uselinearb}{}
\newcommand{\usesanskrit}{}
\newcommand{\usearmenian}{}
\newcommand{\usehittite}{}
\newcommand{\usehebrew}{}
\DeclareOption{glossariocompleto}{\renewcommand{\selection}{selection=all}}
\DeclareOption{linearb}{
  \renewcommand{\uselinearb}{
    \babelprovide[]{linearb}
    \babelfont[linearb]{rm}[]{Noto Sans Linear B}
  }
}
\DeclareOption{hebraico}{
  \renewcommand{\usehebrew}{
    \babelprovide[import]{hebrew}
    \babelfont[hebrew]{rm}[Scale=0.8]{Ezra SIL}
  }
}
\DeclareOption{sanskrit}{
  \renewcommand{\usesanskrit}{
    \babelprovide[import,onchar=ids fonts]{sanskrit}
    \babelfont[sanskrit]{rm}[Scale=1]{AdishilaLetterpressHeavy}
    \babelfont[sanskrit]{sf}[Scale=1]{AdishilaLetterpressHeavy}
  }
}
\DeclareOption{armenian}{
  \renewcommand{\usearmenian}{
    \babelprovide[import, onchar=ids fonts letters]{armenian}
    \babelfont[armenian]{rm}[Scale=0.8]{Noto Serif Armenian}
  }
}
\DeclareOption{hittite}{
  \renewcommand{\usehittite}{
    \babelprovide{hittite}
    \babelfont[hittite]{rm}{UllikummiA}
  }
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
% Formato ABNT de página A4 como padrão
\LoadClass[a4paper, 12pt, twoside, openright]{memoir}
% END: OPÇÕES

% BEGIN: FORMATAÇÃO GERAL
\settypeoutlayoutunit{mm}
\settrimmedsize{\stockheight}{\stockwidth}{*}
\settypeblocksize{247mm}{160mm}{*}
\setlrmargins{30mm}{*}{*}
\setulmargins{30mm}{*}{*}
\setlength{\footskip}{1.5\baselineskip}
\checkandfixthelayout%
\DoubleSpacing%
\setcolsepandrule{2.5em}{0pt}
% Evita linhas viúvas e linhas órfãs
\clubpenalty=9996
\widowpenalty=9999
\brokenpenalty=4991
\predisplaypenalty=10000
\postdisplaypenalty=1549
\displaywidowpenalty=1602
% Decorando páginas
\makeoddfoot{plain}{}{}{\small\thepage}
\makeevenfoot{plain}{\small\thepage}{}{}
\makepagestyle{ruled}
\makeevenfoot{ruled}{\small\thepage}{}{} % page numbers at the outside
\makeoddfoot{ruled}{}{}{\small\thepage}
\makeheadrule{ruled}{\textwidth}{0.75pt}
\makeevenhead{ruled}{\small\leftmark}{}{}
\makeoddhead{ruled}{}{}{\small\rightmark}
\makepsmarks{ruled}{%
	\nouppercaseheads%
	\createmark{chapter}{left}{shownumber}{}{.\space}
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
\chapterstyle{hangnum}
% Até que nível numerar?
\setsecnumdepth{subsubsection}
% Até que nível incluir no sumário?
\setcounter{tocdepth}{3}
% Capítulo não numerado mas no sumário
\newcommand\chap[1]{%
	\chapter*[#1]{#1}%
	\addcontentsline{toc}{chapter}{#1}}
% Seção não numerada mas no sumário
\newcommand\ssec[1]{%
	\section*{#1}%
	\addcontentsline{toc}{section}{#1}}
% Subseção não numerada mas no sumário
\newcommand\subssec[1]{%
	\subsection*{\emph{#1}}%
	\addcontentsline{toc}{subsection}{#1}}
% Indentação de seções, subseções e subsubseções
\setlength{\cftsectionindent}{1em}
\setlength{\cftsubsectionindent}{2em}
\setlength{\cftsubsubsectionindent}{3em}
% Citação na ABNT
\RequirePackage{scrextend}
\newenvironment{citacao}{
	\SingleSpacing%
	\begin{addmargin}[4cm]{0em}
		\small
		}{
	\end{addmargin}
	\bigskip
	\DoubleSpacing%
}
% END: FORMATAÇÃO GERAL

% BEGIN: PÁGINAS ESPECIAIS
\newlength{\linespace}
\setlength{\linespace}{\baselineskip} % current equivalent of \onelineskip
\newlength{\toptafiddle} \setlength{\toptafiddle}{2\linespace}
\newlength{\bottafiddle} \setlength{\bottafiddle}{0pt}
\newlength{\topfiddle}
\setlength{\topfiddle}{\toptafiddle}
\newlength{\botfiddle}
\setlength{\botfiddle}{\onelineskip}

\setlength{\footmarkwidth}{0.5em}
\setlength{\footmarksep}{0em}
\setlength{\footparindent}{0em}
\footmarkstyle{\textsuperscript{#1}\hspace{0.5em}}

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
\let\olddate\date%
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

\providecommand{\imprimirbancaD}{}
\providecommand{\imprimirbancaDTitulo}{}
\providecommand{\imprimirbancaDInstituicao}{}
\newcommand{\bancaD}[3]{
	\renewcommand{\imprimirbancaDTitulo}{#1}
	\renewcommand{\imprimirbancaD}{#2}
	\renewcommand{\imprimirbancaDInstituicao}{#3}
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
			{\scshape\large
				\imprimiruniversidade\par
				\imprimirfaculdade\par
				\imprimirprograma%
				\par
			}

			\vspace{6cm}
			{\large \imprimirautor}\par
			\vspace{2cm}
			{\Large \imprimirtitulo}\par
			\bigskip
			{\large \imprimirsubtitulo}\par
			\vspace{1cm}

			\textbf{Versão \imprimirversao}
			\vfill
			{\large\scshape
				\SingleSpacing%
				\imprimirlocal\par\smallskip
				\imprimirdata%
				\par}
			\enlargethispage{\bottafiddle}
			\clearpage
		}}

\newcommand{\gerardescricao}[0]{%
	\begin{minipage}{.5\textwidth}\SingleSpacing%
		\imprimirtipotrabalho{} apresentada ao \imprimirprograma{} da
		\imprimirfaculdade{},
		\imprimiruniversidade{}, como exigência parcial para
		a obtenção do título de \imprimirtitulacao{}.
		\par
		\vspace{1em}
		Orientador: \mbox{\imprimirorientador}%
		\par
	\end{minipage} }

\newcommand{\gerardescricaoB}[0]{%
	\begin{minipage}{.5\textwidth}\SingleSpacing%
		\imprimirtipotrabalho{} apresentada ao \imprimirprograma{} da
		\imprimirfaculdade{},
		\imprimiruniversidade{}, como exigência parcial para
		a obtenção do título de \imprimirtitulacao{}.
		\par
	\end{minipage} }

\newcommand{\folhaderosto}{
	{%
			\cleardoublepage%
			\thispagestyle{empty}
			\centering
			\vspace*{-\toptafiddle}
			{\scshape\large
				\imprimirautor%
				\par
			}

			\vspace{9cm}
			{\Large \imprimirtitulo}\par
			\bigskip
			{\large \imprimirsubtitulo}\par
			\vspace{1cm}
			{\bfseries Versão \imprimirversao}\\
			\vfill

			{\hspace{.45\textwidth}
				\gerardescricao{}
			}
			\vfill
			{\large\scshape
				\SingleSpacing%
				\imprimirlocal\par\smallskip
				\imprimirdata%
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
			{\scshape\large
				\imprimirautor%
				\par
			}

			\vspace{2em}
			{\Large \imprimirtitulo}\par
			\smallskip
			{\large \imprimirsubtitulo}\par
			\vspace{1em}
			{\hspace{.45\textwidth}
				\gerardescricaoB{}
				\vspace{1em}

				Trabalho aprovado.\ \imprimirlocal, \imprimirdataDefesa{}.\par\vspace{4em}

				{
					\SingleSpacing%
					\hrule
					\vspace{1.5mm}
					\textbf{\imprimirorientadorTitulo{} \imprimirorientador{}}\\\smallskip
					Orientador{}

					\vspace{4em}
					\hrule
					\vspace{1.5mm}
					\textbf{\imprimirbancaATitulo{} \imprimirbancaA{}} \\\smallskip
					\imprimirbancaAInstituicao{}

					\vspace{4em}
					\hrule
					\vspace{1.5mm}
					\textbf{\imprimirbancaBTitulo{} \imprimirbancaB{}} \\\smallskip
					\imprimirbancaBInstituicao{}

					\vspace{4em}
					\hrule
					\vspace{1.5mm}
					\textbf{\imprimirbancaCTitulo{} \imprimirbancaC{}} \\\smallskip
					\imprimirbancaCInstituicao{}

					\vspace{4em}
					\hrule
					\vspace{1.5mm}
					\textbf{\imprimirbancaDTitulo{} \imprimirbancaD{}} \\\smallskip
					\imprimirbancaDInstituicao{}
				}
			}

			\vfill
			{\large\scshape
				\SingleSpacing%
				\imprimirlocal%
				\par
				\smallskip
				\imprimirdata%
				\par}
			\enlargethispage{\bottafiddle}
			\clearpage}
}

\newcommand{\colofao}[0]{
	\pagestyle{empty}
	\cleartoevenpage%
	\SingleSpacing%
	\null\vfill
	\begin{adjustwidth}{14em}{1.21em}
		\begin{flushleft}
			\small
			\textbf{Colofão}\par
			Esse documento foi diagramado usando o sistema de diagramação
			\href{https://lualatex.org}{Lua\TeX} mantido por Manuel Pégourié-Gonnard.\\
			As fontes utilizadas foram: \mbox{Gentium Book (texto latino)};
			\mbox{\grc{Brill (texto grego)}};
			\mbox{\ipa{Gentium (complementos fonológicos)}};
			\mbox{\syntax{Noto Sans (notação sintática e glosas)}}.
			\mbox{O texto está em tamanho 12/14,5pt}.\par

			{\today.}
		\end{flushleft}
	\end{adjustwidth}
}
% END: PÁGINAS ESPECIAIS

% BEGIN: DEPENDÊNCIAS GERAIS
\RequirePackage{ragged2e}
\RequirePackage{indentfirst}
% Sublinhados com \uline e ondinhas com \uwave
\RequirePackage[normalem]{ulem}
% Tabelas e floats
\RequirePackage{longtable}
\RequirePackage{colortbl}
\RequirePackage{pdflscape}
\RequirePackage{pdfpages}
\RequirePackage{tabu}
\RequirePackage{threeparttable}
\RequirePackage{threeparttablex}
\RequirePackage{makecell}
\RequirePackage{multicol}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage{wrapfig}
\RequirePackage{float}
\RequirePackage{subcaption}
\RequirePackage{rotating}
\RequirePackage{graphicx}
% Listas com compactenum, compactlist, inparaenum
\RequirePackage{paralist}
% Matemática
\RequirePackage{amsmath}
\RequirePackage{amssymb}
% Tikz (diagramas)
\RequirePackage{tikz} %for all basic options
\RequirePackage{tikz-qtree} %for simple tree syntax
\RequirePackage{tree-dvips}
\usepgflibrary{arrows} %for arrow endings
\usetikzlibrary{positioning,shapes.multipart} %for structured nodes
\usetikzlibrary{tikzmark}
% END: DEPENDÊNCIAS GERAIS

% BEGIN: CORES
\RequirePackage{xcolor}
\definecolor{green}{RGB}{16, 87, 87} % rgb(16,87,87)
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}
% END: CORES

% BEGIN: REFERÊNCIA CRUZADA, BIBLIOGRAFIA, ÍNDICES, GLOSSÁRIOS
\RequirePackage[pdfusetitle]{hyperref}
\hypersetup{%
	colorlinks=true, % false: boxed links; true: colored links
	linkcolor=green,  % color of internal links
	citecolor=green,  % color of links to bibliography
	filecolor=green,  % color of file links
	urlcolor=green,
}
% Localização de referências cruzadas
\renewcommand{\figureautorefname}{Figura}
\renewcommand{\tableautorefname}{Tabela}
\renewcommand{\sectionautorefname}{Seção}
\renewcommand{\chapterautorefname}{Capítulo}
\renewcommand{\subsectionautorefname}{Seção}
\renewcommand{\subsubsectionautorefname}{Seção}
\newcommand{\subsubsectionaname}{Seção}
\renewcommand{\appendixpagename}{Apêndices}
\renewcommand{\appendixtocname}{Apêndices}
\renewcommand{\appendixname}{Apêndice}
\renewcommand{\appendixautorefname}{Apêndice}
\newcommand{\aref}[1]{\hyperref[#1]{Apêndice~\ref{#1}}}
% Glossário
\RequirePackage{datatool}
\RequirePackage{tracklang}
\TrackLangShowWarningsfalse%
\RequirePackage[backend=biber,
	style=./biblatex/abnt-caio, language=brazil,
	pretty, autolang=hyphen,
	pretty, repeatfields, noslsn, natbib, extrayear, giveninits, useeditor
]{biblatex}
\addbibresource{./biblio.bib}
\RequirePackage{emoji}

\let\printindex\undefined%
\RequirePackage[record,index,section,nomain,style=mcolalttree,stylemods={mcols,bookindex}]{glossaries-extra}
\newglossary*{abbreviation}{Abreviações}
\newglossary*{authwork}{Autores e obras antigos}
\newglossary*{passagens}{Autores, obras e passagens citadas}
\newglossary*{lang}{Línguas}
\newglossary*{linguas}{Línguas}
\newglossary*{gram}{Glosas}
\newglossary*{acronym}{Acrônimos}

\GlsXtrLoadResources[
	src={gloss},
	sort={pt-BR},
	match={entrytype={abbreviation}},
	type={same as category},
	\selection%
]
\GlsXtrLoadResources[
	src={acronyms},
	sort={pt-BR},
	type=acronym,
	\selection%
]
\GlsXtrLoadResources[
	src={./abbrev},
	sort={pt-BR},
	type=abbreviation,
	\selection%
]


\GlsXtrLoadResources[
	src={authors,passagens},
	set-widest,
	type=passagens,
	label-prefix={idx.},
	dual-prefix={},
	cs-label-prefix={},
	combine-dual-locations={primary},
	dual-field,
	sort={letternumber-case},
	sort-field={name},
	dual-type={same as category},
	dual-sort={en},
	dual-sort-number-pad={2},
	dual-sort-pad-plus={1},
	dual-sort-pad-minus={0},
	dual-break-at=upper-upper-word,
	entry-type-aliases={
			abbreviation=dualindexabbreviation,
			entry=dualindexentry,
			acronym=acronym,
			passage=index
		},
	abbreviation-name-fallback={long},
	custom-sort-fallbacks={passage=useriii},
	symbol-sort-fallback={name},
	\selection%
]

\GlsXtrLoadResources[
	src={linguas},
	set-widest,
	type=linguas,
	label-prefix={idx.},
	dual-prefix={},
	cs-label-prefix={},
	combine-dual-locations={primary},
	dual-field,
	sort={pt-BR},
	sort-field={name},
	dual-type={same as category},
	dual-sort={pt-BR},
	dual-sort-number-pad={2},
	dual-sort-pad-plus={1},
	dual-sort-pad-minus={0},
	dual-break-at=upper-upper-word,
	entry-type-aliases={
			lingua=dualindexabbreviation
		},
	abbreviation-name-fallback={long},
	\selection%
]
\newcommand{\passagem}[1]{\ifglshasparent{\glsentryparent{idx.#1}}{\glsxtrusefield{\glsentryparent{\glsentryparent{idx.#1}}}{useri},
	}{}\glsxtrusefield{\glsentryparent{idx.#1}}{useri},
	\gls{idx.#1}\ifglshasfield{useri}{idx.#1}{ =~\hyperref[corp:#1]{C\glsentryuseri{idx.#1}}}{}}
\newcommand{\entrada}[1]{\glsuserii{\glsentryparent{\glsentryparent{idx.#1}}} (\glsuseriii{\glsentryparent{\glsentryparent{idx.#1}}}), \glsuserii{\glsentryparent{idx.#1}} (\glsuseriii{\glsentryparent{idx.#1}}), \gls{idx.#1}}
% END: REFERÊNCIA CRUZADA, BIBLIOGRAFIA, ÍNDICE, GLOSSÁRIOS

% BEGIN: FONTES, LÍNGUAS, UNICODE
\RequirePackage{csquotes}
\RequirePackage{fontspec}
\RequirePackage{emoji}
\RequirePackage{mathpazo}
\RequirePackage{hyphenat}
\RequirePackage[main=brazil, bidi=basic]{babel}
\defaultfontfeatures{Renderer=Harfbuzz}
\babelfont[brazil]{rm}[Script=Latin]{Gentium Book}
\babelfont[brazil]{sf}{Noto Sans}
\babelfont[brazil]{tt}[Scale=0.8]{Mononoki Nerd Font}
\babelfont[german]{rm}[Script=Latin]{Gentium Book}
\babelfont[german]{sf}{Noto Sans}
\babelfont[german]{tt}[Scale=0.8]{Mononoki Nerd Font}
\babeltags{de=german}
\babelfont[english]{rm}[Script=Latin]{Gentium Book}
\babelfont[english]{sf}{Noto Sans}
\babelfont[english]{tt}[Scale=0.8]{Mononoki Nerd Font}
\babelprovide[import, onchar=ids fonts]{ancientgreek}
\babelfont[ancientgreek]{rm}[BoldFont=Gentium Book Bold]{Brill}
\babeltags{grc = ancientgreek}
\babelprovide[]{ipa}
\babelfont[ipa]{rm}{Gentium}
\babeltags{ipa = ipa}
\babelprovide[]{syntax}
\babelfont[syntax]{rm}[Scale=0.85]{Noto Sans}
\babeltags{syntax = syntax}
\babelprovide[import, onchar=ids fonts letters]{russian}
\babelfont[russian]{rm}{Brill}
\usehebrew{}
\usesanskrit{}
\usehittite{}
\usearmenian{}
\uselinearb{}
% END: FONTES, LÍNGUAS, UNICODE

% BEGIN: LISTINGS
\usepackage{listings}
\lstdefinestyle{mystyle}{
	backgroundcolor=\color{backcolour},
	commentstyle=\color{codegreen},
	keywordstyle=\color{magenta},
	numberstyle=\tiny\color{codegray},
	stringstyle=\color{codepurple},
	basicstyle=\ttfamily,
	breakatwhitespace=false,
	breaklines=true,
	captionpos=b,
	keepspaces=true,
	numbers=left,
	numbersep=5pt,
	showspaces=false,
	showstringspaces=false,
	showtabs=false,
	tabsize=2
}
\lstset{style=mystyle}
% END: LISTINGS


% BEGIN: GLOSAS
% Glosas de Leipzig com \ex.
\RequirePackage{linguex}
\alignSubExtrue%
\setlength{\Exlabelsep}{0.5em}
\setlength{\SubExleftmargin}{1.5em}
\setlength{\SubExleftmargin}{1.0em}
% Diagramas da Lexical Functional Grammar
\RequirePackage{langsci-avm}
% Macros para glosas
\newcommand{\gloss}[1]{\foreignlanguage{syntax}{\textsc{#1}}}
\newcommand{\Sg}{\gloss{Sg}}
\newcommand{\Adv}{\gloss{Adv}}
\newcommand{\Neg}{\gloss{Neg}}
\newcommand{\Pl}{\gloss{Pl}}
\newcommand{\iPl}{\gloss{1Pl}}
\newcommand{\iiPl}{\gloss{2Pl}}
\newcommand{\iiiPl}{\gloss{3Pl}}
\newcommand{\iSg}{\gloss{1Sg}}
\newcommand{\iiSg}{\gloss{2Sg}}
\newcommand{\iiiSg}{\gloss{3Sg}}
\newcommand{\Art}{\gloss{Art}}
\newcommand{\PRO}{\gloss{pro}}
\newcommand{\pro}{\textsyntax{\emph{pro}}}
\newcommand{\Part}{\gloss{Part}}
\newcommand{\Med}{\gloss{Med}}
\newcommand{\Pass}{\gloss{Pass}}
\newcommand{\Comp}{\gloss{Comp}}
\newcommand{\Pron}{\gloss{Pron}}
\newcommand{\Nom}{\gloss{Nom}}
\newcommand{\Mass}{\gloss{Mass}}
\newcommand{\Det}{\gloss{Det}}
\newcommand{\Dat}{\gloss{Dat}}
\newcommand{\Fut}{\gloss{Fut}}
\newcommand{\Pres}{\gloss{Pres}}
\newcommand{\Rel}{\gloss{Rel}}
\newcommand{\Interr}{\gloss{Interr}}
\newcommand{\Opt}{\gloss{Opt}}
\newcommand{\Atv}{\gloss{Atv}}
\newcommand{\Indef}{\gloss{Indef}}
\newcommand{\Voc}{\gloss{Voc}}
\newcommand{\Interj}{\gloss{Interj}}
\newcommand{\Prep}{\gloss{Prep}}
\newcommand{\F}{\gloss{F}}
\newcommand{\M}{\gloss{M}}
\newcommand{\Neut}{\gloss{Neut}}
\newcommand{\Acu}{\gloss{Acu}}
\newcommand{\Gen}{\gloss{Gen}}
\newcommand{\Inf}{\gloss{Inf}}
\newcommand{\Conj}{\gloss{Conj}}
\newcommand{\Particl}{\gloss{Particl}}
% Evita quebra de página dentro de glosas
\makeatletter
\apptocmd{\gl@stop}{\nobreak}{}{}
\makeatother
% END: GLOSAS
