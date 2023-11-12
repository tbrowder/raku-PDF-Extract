#!/usr/bin/env raku
use lib '../lib';

use PDF::Extract;

my $extract = Extract.new: file => '../resources/sample.pdf';

say $extract.text;
say $extract.html;
say $extract.xml;
