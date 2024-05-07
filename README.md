[![License: Artistic-2.0](https://img.shields.io/badge/License-Artistic%202.0-0298c3.svg)](https://opensource.org/licenses/Artistic-2.0)

# raku PDF::Extract

Simple binding of the pdftotext command line utility

### Installation

1. ```brew install poppler``` (MacOS) or ```sudo apt-get install poppler-utils``` (ubuntu)
2. ```zef install PDF::Extract```

To install poppler on other popular (geddit?) systems such as Nix or Windows, please see the installation instructions [here](https://poppler.freedesktop.org) and use your Nix package manager (e.g. ```sudo aptitude``` on Debian) or go [here](https://github.com/oschwartz10612/poppler-windows) for Windoze binaries (this module not yet tested on Windows).

### Synopsis

```
use PDF::Extract;

my $extract = Extract.new: file => '../resources/sample.pdf';

say $extract.text;
say $extract.html;
say $extract.xml;

say $extract.so;   #test for PDF headers
say $extract.info;
say $extract.info<CreationDate>;
...

### Copyright
copyright(c) 2023 Henley Cloud Consulting Ltd.
