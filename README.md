# AttachFuriganaTex
A simple script that takes Japanese sentence input and attatches furigana for use in LaTeX documents.

## Installation
1. Install Ruby, then

`$ gem install natto` ([link](https://github.com/buruzaemon/natto))

`$ gem install nkf` ([link](https://github.com/ruby/nkf))

2. Make sure MeCab (used for parsing words) is installed locally on your system, per [Natto's ReadMe](https://github.com/buruzaemon/natto?tab=readme-ov-file#requirements)

## Usage

`$ ruby attachfuriganatex.rb`

## Latex Usage
The generated output is for use with /ruby tags from the [pxrubrica](https://github.com/zr-tex8r/PXrubrica) package.

## Example latex configuration
(Works on Overleaf, must use lualatex compiler)

```
\documentclass[article,tate]{jlreq} % vertical  
\usepackage[match]{luatexja-fontspec}
\usepackage{pxrubrica}
\setmainjfont{TakaoMincho}
% \setsansjfont{TakaoGothic}
% \setmonojfont{Komatuna}
\begin{document}
\title{第一章}
\date{}
\maketitle

% Insert text here.

\end{document}
```
