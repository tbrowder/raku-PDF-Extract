[![License: Artistic-2.0](https://img.shields.io/badge/License-Artistic%202.0-0298c3.svg)](https://opensource.org/licenses/Artistic-2.0)

# raku PDF::Extract

Simple binding of the pdftotext command line utility

### Installation

1. ```brew install poppler``` (ie. MacOS)
2. ```zef install PDF::Extract```

### Synopsis

```
use PDF::Extract;

my $extract = Extract.new: file => '../resources/sample.pdf';

say $extract.text;
say $extract.html;
say $extract.xml;
...

### Copyright
copyright(c) 2023 Henley Cloud Consulting Ltd.
