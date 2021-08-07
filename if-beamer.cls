\ProvidesClass{if-beamer}[Instituto Federal de Ciência e Tecnologia, versão 1.0]
\NeedsTeXFormat{LaTeX2e}

% Parent class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions \relax
\LoadClass{beamer} % o [t] faz com que o texto comece no inicio dos slides, não ao meio como é de costume acontecer

% Set subtitles black
\usecolortheme[named=black]{structure}

\setbeamertemplate{section in toc}[sections numbered] % gera a numeração das seções no sumário
\setbeamertemplate{subsection in toc}[subsections numbered]  % gera a numeração das subseções no sumário

%Font sizes
\setbeamerfont*{title}{size=\LARGE}
\setbeamerfont*{subtitle}{size=\normalsize}
\setbeamerfont{normal text}{size=\footnotesize}
\AtBeginDocument{\usebeamerfont{normal text}}


% News commands
% \newcommand{\titulo}{\def\inserttitulo{{\large \bf \inserttitle } \\[3mm] {\small \insertauthor}}}% Cria o comando para adicionar o titulo da aula
\newcommand{\titulo}[2]{\def\inserttitulo{{\large \bf #1 } \\[3mm] {\small #2}}}% Cria o comando para adicionar o titulo da aula
\titulo{}{}

% Remove default logo
\logo{}

% Remove navigation bar
\beamertemplatenavigationsymbolsempty

% Background
\usepackage{tikz}

\usebackgroundtemplate{
    \begin{tikzpicture}[overlay,remember picture]
        % % Background picture
        % \node[at=(current page.south east),anchor=south east,inner sep=0pt,outer sep=0pt] {
        %     \includegraphics[keepaspectratio,height=0.8\paperheight]{uu_logo_bg}};

        % Top border
        \draw [line width=2mm,color=bgcolor] (current page.north west) rectangle (current page.north east);

        % Bottom border
        \draw [line width=5mm,color=bgcolor] (current page.south west) rectangle (current page.south east);

        % Logo
        \node[at=(current page.north west),anchor=north west,inner sep=0pt,outer sep=10pt] {
            \includegraphics[keepaspectratio,height=1.8cm]{urban_lab_logo_text}};


    \end{tikzpicture}
}


% Linha de informações de rodapé com título, autor e número do slide
\setbeamertemplate{footline}{%
\color{white}
\bf
            \hspace{.5cm}%
            \insertshortauthor%
            \hfill%
            \inserttitle%
            \hfill%
            \insertshorttitle%
            \hspace{2em}%
            \insertframenumber{} de \inserttotalframenumber%
            \hspace{.5cm}
    \vskip1pt%
}

% Letter spacing
\usepackage[letterspace=90]{microtype}

% Element margins
\setbeamerfont*{frametitle}{size=\Large} 
\setbeamertemplate{frametitle}[default][left,leftskip=5mm] % horizontal margin left
\addtobeamertemplate{frametitle}{\vskip+1cm \lsstyle}{\vskip+.3cm} % vertical magin + letter spacing

\setbeamersize{text margin left=1cm}
\setbeamersize{text margin right=1cm}

% \setbeamercolor{structure}{fg=bgcolor}

% Uppercase titles
\newcommand{\Frametitle}[1]{\frametitle{\large \MakeUppercase{#1}}}


% Bullet das listas, seções. Desativar caso queira a númeração no súmario.
% \setbeamertemplate{sections/subsections in toc}[circle]
\setbeamertemplate{itemize items}[circle]
\setbeamertemplate{itemize item}[circle]
\setbeamertemplate{itemize subitem}[circle]

% Fonts 
% \usepackage{mathptmx}
\usepackage{helvet}
% \usefonttheme{serif} % Uncomment to use Times-like font


%%%%%%%%%%%%%%%%%%%% Standard frames %%%%%%%%%%%%%%%%%%%

%______ Title page ______%
\defbeamertemplate*{title page}{customized}[1][]
{
    \begin{frame}
        \clearpage
        \vspace*{\fill}
        \begin{center}
            \usebeamerfont*{title} \textls[90]{\MakeUppercase{\inserttitle}}\par
            \vspace{15pt}
            \usebeamerfont{subtitle}\usebeamercolor[fg]{subtitle}\textls[150]{\small \MakeUppercase{\insertsubtitle}}\par
        \end{center}
        \vfill
        \clearpage
    \end{frame}
}

%______ Logo page ______%
\definecolor{bgcolor}{RGB}{50,160,65}

\newcommand{\logopage}{
    {
        \usetikzlibrary{backgrounds}
        \usebackgroundtemplate{
            \tikz[overlay,remember picture,background rectangle/.style={fill=bgcolor}, show background rectangle]
            \node[at=(current page.north west),anchor=north west,inner sep=-2pt, inner xsep=1cm] {
              \includegraphics[keepaspectratio,width=2cm]{uu_logo_red}};
          }

        \begin{frame}[plain]
        \vspace{5cm}
            \begin{flushleft}
                \color{white} \textls[80]{\inserttitulo}
            \end{flushleft}
        \end{frame}
    }
}


%%%%%%%%%%%%%%%%%%%% Custom frames %%%%%%%%%%%%%%%%%%%

%______ Subtitle page ______%
\newcommand{\anothertitle}[2]
{
    \begin{frame}
        \clearpage
        \vspace*{\fill}
        \begin{center}
                \usebeamerfont*{title}{\textls[90]{\MakeUppercase{#1}}}\par
                \vspace{15pt}
                \usebeamerfont{subtitle}\usebeamercolor[fg]{subtitle}\textls[150]{\small \MakeUppercase{#2}}\par
        \end{center}
        \vfill
        \clearpage
        \end{frame}
}

%______ Title + graphics + subtitle page ______%
\newcommand{\titleimage}[3]
{
    {
        \setbeamertemplate{frametitle}[default][center]
        \addtobeamertemplate{frametitle}{\vskip+1cm}{}

        \begin{frame}
            \frametitle[center]{\LARGE {\textls[90]{\MakeUppercase{#1}}}}

            \begin{center}
                \includegraphics<1>[height=4.5cm]{{#3}} \par
                \vspace{0.5cm}
                \scriptsize
                \textls[150]{\MakeUppercase{#2}}
            \end{center}
            
        \end{frame}
    }
}


%______ Fullsize image page ______%
\newcommand{\fullimage}[1]
{
    {
        \usebackgroundtemplate{
            \begin{tikzpicture}[overlay,remember picture]

                % Background picture
                \node[at=(current page.south east),anchor=south east,inner sep=0pt,outer sep=0pt] {
                    \includegraphics[keepaspectratio,height=0.8\paperheight]{uu_logo_bg}};

                % Image
                \node[at=(current page.center),anchor=center,inner sep=0pt,outer sep=0pt] {
                    \includegraphics[keepaspectratio,width=\paperwidth,height=\paperheight]{{#1}}};

                % Top border
                \draw [line width=2mm,color=bgcolor] (current page.north west) rectangle (current page.north east);

                % Bottom border
                \draw [line width=2mm,color=bgcolor] (current page.south west) rectangle (current page.south east);

            \end{tikzpicture}
        }
        \begin{frame}[plain]
        \end{frame}
    }
}

% \usepackage{pslatex}
% \usepackage[math]{kurier}
% CONFIGURAÇÕES
% \setmainfont{OpenSans-Regular.ttf}[
% Path=estrutura/font/asap/,
% BoldFont={OpenSans-SemiBold.ttf},
% ItalicFont={OpenSans-Italic.ttf},
% BoldItalicFont={OpenSans-BoldItalic.ttf}
% ]

% \setmainfont{NotoSans-Regular.ttf}[
% Path=estrutura/font/noto/sans/,
% BoldFont={NotoSans-Bold.ttf},
% ItalicFont={NotoSans-Italic.ttf},
% BoldItalicFont={NotoSans-BoldItalic.ttf}
% ]

% \setsansfont{NotoSerif-Regular.ttf}[
% Path=estrutura/font/noto/serif/,
% BoldFont={NotoSerif-Bold.ttf},
% ItalicFont={NotoSerif-Italic.ttf},
% BoldItalicFont={NotoSerif-BoldItalic.ttf}
% ]


% % Title page
% \setbeamerfont{title}{size=\Large,shape=\bfseries}
% \setbeamerfont{subtitle}{size=\small,shape=\normalfont}
% \setbeamerfont{section in toc}{size=\large,shape=\normalfont}
% \setbeamerfont{subsection in toc}{size=\large}
% \setbeamerfont{author}{size=\Large,shape=\normalfont}
% \setbeamerfont{institute}{size=\footnotesize}
% \setbeamerfont{date}{size=\footnotesize,shape=\normalfont}
% \setbeamerfont{details}{size=\footnotesize,shape=\normalfont}
% \setbeamerfont{aula}{size=\tiny,shape=\bfseries}

% % Slide title
% \setbeamerfont{frametitle}{size=\large,shape=\bfseries}
% \setbeamerfont{framesubtitle}{size=\normalsize,shape=\normalfont}
% \setbeamerfont{item projected}{size=\footnotesize}
% \setbeamerfont{subitem projected}{size=\scriptsize}
% \setbeamerfont{subsubitem projected}{size=\tiny}

% % Blocks
% \setbeamerfont{block title}{size=\normalfont,shape=\strut}
% \setbeamerfont{blockdef}{size=\large,shape=\bfseries}

% % Description
% \setbeamerfont{description item}{shape=\bfseries}
