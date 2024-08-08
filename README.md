PDF::Extract
============

Simple binding of the pdftotext command line utility

Installation
============

Step 1 
-------

  * Linux (Debian/Ubuntu)

    `sudo apt-get install poppler-utils`

  * MacOS

    `brew install poppler`

  * Windows

    `choco install poppler`

Step 2
------

`zef install PDF::Extract`

SYNOPSIS
========

    use PDF::Extract;

    my $extract = Extract.new: file => '../resources/sample.pdf';

    say $extract.text;
    say $extract.html;
    say $extract.xml;

    say $extract.so;   #test for PDF headers
    say $extract.info;
    say $extract.info<CreationDate>;
    ...

COPYRIGHT and LICENSE
=====================

Copyright © 2023 Henley Cloud Consulting Ltd.

This library is free software; you may redistribute it or modify it under the Artistic License 2.0.

