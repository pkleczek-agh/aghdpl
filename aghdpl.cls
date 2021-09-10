%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% File:     aghdpl.cls           (LaTeX Document class option "aghdpl")
%          
% Author:  Paweł Kłeczek      (pkleczek@agh.edu.pl)
%          Grzegorz J. Nalepa (gjn@agh.edu.pl)
%          Marcin Szpyrka     (mszpyrka@agh.edu.pl)
%          AGH University of Science and Technology, Kraków, POLAND
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\message{*** [aghdpl.cls] ---  (PK, GJN, MSz)  v4.0 <2020-11-03>  ***}       

\newif\ifpdflatex\pdflatexfalse
\NeedsTeXFormat{LaTeX2e} % 
\ProvidesClass{aghdpl} 

\RequirePackage{kvoptions}

\DeclareStringOption[pl]{language}
\ProcessKeyvalOptions*

\DeclareOption{pdflatex}{\pdflatextrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}} 
\ProcessOptions\LoadClass[a4paper,twoside,openright]{report} 

\RequirePackage{xstring}

\show\aghdpl@language

\newcommand{\ThesisLanguage}{pl}
\IfStrEqCase{\aghdpl@language}{%
	{en}{\renewcommand{\ThesisLanguage}{en}}%
	{pl}{\renewcommand{\ThesisLanguage}{pl}}%
}[\PackageError{aghdpl}{Invalid thesis language.}{Available languages: Polish (pl), English (en)}]

\show\ThesisLanguage

\RequirePackage{times}
\RequirePackage[T1]{fontenc}

% Lista wszystkich języków stanowiących języki pozycji bibliograficznych użytych w pracy.
% (Zgodnie z zasadami tworzenia bibliografii każda pozycja powinna zostać utworzona zgodnie z zasadami języka, w którym dana publikacja została napisana.)
\RequirePackage[english,polish]{babel}

% Użyj polskiego łamania wyrazów (zamiast domyślnego angielskiego).
\RequirePackage{polski}

% Użyj kodowania UTF-8.
\RequirePackage[utf8]{inputenc}

\RequirePackage{mathtools}
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amsthm}

\RequirePackage{graphicx}
\RequirePackage[usenames]{color}
\RequirePackage{url}
\RequirePackage{titlesec}
\RequirePackage{tocloft}

\RequirePackage[font=small, labelfont=bf, labelsep=period]{caption}
\RequirePackage{subcaption}
\RequirePackage{enumerate}
\RequirePackage{enumitem}

% =============================================================================
% SEC:   Ustawienia związane z formatowaniem tekstu
% =============================================================================

\RequirePackage{geometry}

\geometry{lmargin=30mm, rmargin=20mm, tmargin=30mm, bmargin=30mm, foot=10mm, head=10mm}  % rozmiary marginesów i nagłówka/stopki
\linespread{1.25}  % interlinia
\renewcommand{\labelitemi}{--}  % znak wypunktowania użyty w liście wypunktowania

\RequirePackage[all,defaultlines=2]{nowidow} % Kontrola sierot i wdów - działa lepiej niż \widowpenalty i \clubpenalty
\brokenpenalty=10000\relax

% =============================================================================
% SEC:   Polecenia wymagane m.in. do generowania strony tytułowej
% =============================================================================

\def\shorttitlePL#1   {\gdef\@shorttitlePL{#1}}
\def\shorttitleEN#1   {\gdef\@shorttitleEN{#1}}
\def\shortauthor#1    {\gdef\@shortauthor{#1}}
\def\titlePL#1        {\gdef\@titlePL{#1}}
\def\titleEN#1        {\gdef\@titleEN{#1}}
\def\faculty#1      {\gdef\@faculty{#1}}
\def\thesistype#1   {\gdef\@thesistype{#1}}
\def\supervisor#1   {\gdef\@supervisor{#1}}
\def\acknowledgements#1   {\gdef\@acknowledgements{#1}}
\def\department#1   {\gdef\@department{#1}}
\def\degreeprogramme#1 {\gdef\@degreeprogramme{#1}}

%------------------------------------------------------------------------------

\IfStrEqCase{\ThesisLanguage}{
	{pl}{%
		\def\thesisheaders{
			\fancyfoot[LE,RO]{\small \@shortauthor\quad\textit{\@shorttitlePL}}
		}
		
		\def\thesistable{
			\begin{tabular}{p{45mm}l}
				Autor: & {\itshape \@author}\\[-1mm]
				Kierunek studiów: & {\itshape \@degreeprogramme}\\[-1mm]
				Opiekun pracy: & {\itshape \@supervisor}\\
			\end{tabular}
		}
	}
	{en}{%
		\def\thesisheaders{
			\fancyfoot[LE,RO]{\small \@shortauthor\quad\textit{\@shorttitleEN}}
		}
		
		\def\thesistable{
			\begin{tabular}{p{45mm}l}
			Author: & {\itshape \@author}\\[-1mm]
			Degree programme: & {\itshape \@degreeprogramme}\\[-1mm]
			Supervisor: & {\itshape \@supervisor}\\
			\end{tabular}
		}
	}%
}

\newcommand{\titlepages}{%

	\titlepage
	
	\begin{center}
		\vspace*{1.5cm}
		
		\includegraphics[scale=0.6]{agh}
		
		\vspace*{2mm}
		{
			\scalebox{0.95}{\sffamily{\large{\bfseries{\scshape Akademia Górniczo-Hutnicza im. Stanisława Staszica w Krakowie}}}}
			
			\vspace*{1mm}
			
			{\sffamily\small\bfseries \@faculty}
		}
		\vspace*{15mm}
		
		{\sffamily\Large \@thesistype}
		\vspace*{9mm}
		
		{\sffamily\Large\itshape
			\IfStrEqCase{\ThesisLanguage}{%
				{pl}{\@titlePL}
				{en}{\@titleEN}
			}
		}
		\vspace*{1mm}
		
		{\sffamily\Large\itshape
			\IfStrEqCase{\ThesisLanguage}{%
				{pl}{\@titleEN}
				{en}{\@titlePL}
			}
		}
		\vspace{\fill}
	\end{center}
	
	\noindent
	{
		\sffamily
		\thesistable
	}
	
	\vspace*{17mm}
	
	\centerline{\small\sffamily Kraków, \@date}
	
	\clearpage
	\thispagestyle{empty} 
	
	% Strona z podziękowaniami.
	{~}\vspace{20mm}
	
	\clearpage
	\titlepage
	
	\vspace*{15cm} \vfill
	\begin{flushright} 
		\begin{minipage}[!h]{10cm}
			{\Large\itshape \@acknowledgements}
		\end{minipage}
	\end{flushright}
	
	\clearpage
	\thispagestyle{empty}
	
	~ \newpage
	
	% Obecna strona będzie mieć nr 5.
	\setcounter{page}{5}
}


% =============================================================================
% SEC:   Ustawienia nagłówków i stopek
% =============================================================================

\RequirePackage{fancyhdr}

\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter.\ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}

\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0.5pt}
\fancyhf{}
\fancyhead{}
\fancyhead[RE,LO]{\slshape{\small \rightmark}}
\fancyhead[RO,LE]{\bfseries \thepage}

\thesisheaders

\frenchspacing
\sloppy 
\flushbottom


% =============================================================================
% SEC:   Ustawienia formatowania tytułów rozdziałów, podrozdziałów, itd.
% =============================================================================

\titleformat{\chapter}[block]
{\bfseries\LARGE}{\filright \LARGE\thechapter. }{0ex}{}
%odstępy: lewy, góra, dół
\titlespacing{\chapter}{0pt}{17mm}{19mm}
\titleformat{\section}[block]
{\bfseries\Large}{\filright \Large\thesection. }{0ex}{}
\titlespacing{\section}{7mm}{8mm plus 0mm minus 1mm}{4mm plus 0mm minus 1mm}
\titleformat{\subsection}[block]
{\bfseries\large}{\filright \large\thesubsection. }{0ex}{}
\titlespacing{\subsection}{7mm}{6mm}{2.5mm}
\titleformat{\subsubsection}[block]
{\bfseries\normalsize}{\filright \normalsize\thesubsubsection. }{0ex}{}
\titlespacing{\subsubsection}{7mm}{3mm}{1.5mm}

% Określ maksymalny poziom numeracji (głębsze poziomy nie będą miały numeru).
%   (np. 1 - chapter, 2 - section, itd.)
\setcounter{secnumdepth}{4}


% =============================================================================
% SEC:   Ustawienia generowania spisu treści i spisu rysunków
% =============================================================================

\renewcommand{\cfttoctitlefont}{\bfseries\Large}
\renewcommand{\cftbeforetoctitleskip}{20mm}
\renewcommand{\cftaftertoctitleskip}{19mm}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdot}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdot}}
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftdot}}
\renewcommand{\cftchapaftersnum}{.}
\renewcommand{\cftsecaftersnum}{.}
\renewcommand{\cftsubsecaftersnum}{.}
\setlength{\cftparskip}{2pt}
\setlength{\cftbeforechapskip}{0mm}
\renewcommand{\cftchappagefont}{\normalsize}


% =============================================================================
% SEC:   Ustawienia wyświetlania liczb (zgodne z polskimi zwyczajami typograficznymi)
% =============================================================================

\RequirePackage{siunitx}

\sisetup{
	output-decimal-marker = {,},  % symbol dziesiętny
	%	round-mode=places,
	%	round-precision=4,
	group-separator={~},  % separator grupy 3 cyfr
}

% =============================================================================
% SEC:   Ustawienia wyświetlania URL-i
% =============================================================================

% Zmiana kroju czcionki URL-i z czcionki o stałej szerokości na szeryfową z kursywą.
\renewcommand\UrlFont{\rmfamily\itshape}


% =============================================================================
% SEC:   Ustawienia podpisów pod ilustracjami
% =============================================================================

\captionsetup[subfigure]{labelfont=md}
\captionsetup{%
	% Użyj okrągłych nawiasów wokół odwołań do "podilustracji".
	subrefformat=parens,
	% Margines z obu stron podpisu.
	margin=2cm,
	% W przypadku podpisów mieszczących się w jednej linii nie stosuj justowania, tylko wyśrodkuj cały podpis.
	singlelinecheck=on,
}


% =============================================================================
%    SEC:   Konfiguracja bibliografii
% =============================================================================

\RequirePackage[
	style=numeric,
	sorting=none,
	%
	% Zastosuj styl wpisu bibliograficznego właściwy językowi publikacji.
	language=autobib,
	autolang=other,
	% Zapisuj datę dostępu do strony WWW w formacie RRRR-MM-DD.
	urldate=iso8601,
	% Nie dodawaj numerów stron, na których występuje cytowanie.
	backref=false,
	% Podawaj ISBN.
	isbn=true,
	% Nie podawaj URL-i, o ile nie jest to konieczne.
	url=false,
	%
	% Ustawienia związane z polskimi normami dla bibliografii.
	maxbibnames=3,
	% Wybór silnika generowania bibliografii:
%	backend=bibtex  % - jeżeli używamy BibTeX-a
	backend=biber   % - jeżeli używamy biber-a
]{biblatex}

\RequirePackage{csquotes}
% Ponieważ `csquotes` nie posiada polskiego stylu, można skorzystać z mocno zbliżonego stylu chorwackiego.
\DeclareQuoteAlias{croatian}{polish}

\addbibresource{bibliografia.bib}

% Nie wyświetlaj wybranych pól.
%\AtEveryBibitem{\clearfield{note}}

\DeclareFieldFormat*{title}{,,\textit{#1}''}


% =============================================================================
%    SEC:   Konfiguracja listingów
% =============================================================================

% Użyj czcionki kroju Courier.
\RequirePackage{courier}

\RequirePackage{listings}
\lstloadlanguages{TeX}

\lstset{
	literate={ą}{{\k{a}}}1
           {ć}{{\'c}}1
           {ę}{{\k{e}}}1
           {ó}{{\'o}}1
           {ń}{{\'n}}1
           {ł}{{\l{}}}1
           {ś}{{\'s}}1
           {ź}{{\'z}}1
           {ż}{{\.z}}1
           {Ą}{{\k{A}}}1
           {Ć}{{\'C}}1
           {Ę}{{\k{E}}}1
           {Ó}{{\'O}}1
           {Ń}{{\'N}}1
           {Ł}{{\L{}}}1
           {Ś}{{\'S}}1
           {Ź}{{\'Z}}1
           {Ż}{{\.Z}}1,
	basicstyle=\footnotesize\ttfamily,
}


% =============================================================================
%    SEC:   Konfiguracja tabel
% =============================================================================

\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\RequirePackage{makecell}
\RequirePackage[flushleft]{threeparttable}

% defines the X column to use m (\parbox[c]) instead of p (`parbox[t]`)
\newcolumntype{C}[1]{>{\hsize=#1\hsize\centering\arraybackslash}X}

% =============================================================================
%    SEC:   INNE
% =============================================================================

\newcommand{\RedefinePlainStyle}{%
	% Ponowne zdefiniowanie stylu `plain`, aby usunąć numer strony z pierwszej strony spisu treści i poszczególnych rozdziałów.
	\fancypagestyle{plain}
	{
		% Usuń nagłówek i stopkę
		\fancyhf{}
		% Usuń linie.
		\renewcommand{\headrulewidth}{0pt}
		\renewcommand{\footrulewidth}{0pt}
	}
}

\AtBeginDocument{
	\renewcommand{\tablename}{Tabela}
	\renewcommand{\figurename}{Rys.}
}

% =============================================================================
% SEC:   Niestandardowe środowiska
% =============================================================================

% ----------------------------------------------------------------------------
%    Środowisko do tworzenia opisów symboli użytych w równaniu
% ----------------------------------------------------------------------------

\SetLabelAlign{parright}{\parbox[t]{\labelwidth}{\raggedleft#1}}
\setlist[description]{style=multiline, topsep=10pt, align=parright}

% Odstęp po obu stronach półpauzy.
\newlength{\descriptiondashgap}
\setlength{\descriptiondashgap}{0.5em}

% Element na liście symboli matematycznych użytych w równaniu (symbol wyrównany do prawej, oddzielony półpauzą od definicji)
\renewcommand*\descriptionlabel[1]{\hspace \labelsep \normalfont \bfseries #1 \mdseries\hspace{\descriptiondashgap}--\hspace{\descriptiondashgap}}

% Odległość półpauzy od lewego marginesu.
\newlength{\eqwheremargin}
\setlength{\eqwheremargin}{2cm}

\newenvironment{eqwhere}[1][]
{%
	\setlength{\eqwheremargin}{#1}%
	\begin{description}[leftmargin=\eqwheremargin, itemsep=0cm, labelsep=0cm]
}
{\end{description}}
