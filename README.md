[![Actions Status](https://github.com/librasteve/raku-PDF-Extract/workflows/linux/badge.svg)](https://github.com/librasteve/raku-PDF-Extract/actions) [![Actions Status](https://github.com/librasteve/raku-PDF-Extract/workflows/macos/badge.svg)](https://github.com/librasteve/raku-PDF-Extract/actions) [![Actions Status](https://github.com/librasteve/raku-PDF-Extract/workflows/windows/badge.svg)](https://github.com/librasteve/raku-PDF-Extract/actions)

PDF::Extract
============

Simple binding of the pdftotext command line utilit

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
    my $file = "some-pdf";
    my $extract = Extract.new: :$file;

    say $extract.text;
    say $extract.html;
    say $extract.xml;

    say $extract.so; # test for PDF headers
    say $extract.info;
    say $extract.info<CreationDate>;
    ...

DESCRIPION
==========

This module provides an interface to the 'pdftotext' program which is part of the 'poppler' library. The class provided, 'Extract', has the following attributes and methods to interrogate its PDF file:

Attributes
----------

  * `has $.file`

    Path of the PDF file

  * `has $.first is rw = 1`

    The first page to extract

  * `has $.last is rw = 0`

    The last page to extract (0: all)

Methods
-------

  * `range($first..$last)`

    First and last pages to extract

  * `text`

    Extracts text from pages range

  * `html`

    Extracts html from pages range

  * `xml`

    Extracts xml from pages range

  * `pdfinfo`

    Has pdfinfo? (Bool)

  * `info`

    Extracts pdfinfo

COPYRIGHT and LICENSE
=====================

Copyright © 2023 Henley Cloud Consulting Ltd.

This library is free software; you may redistribute it or modify it under the Artistic License 2.0.

