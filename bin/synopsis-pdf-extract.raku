#!/usr/bin/env raku
use lib '../lib';

use PDF::Extract;

my $extract = Extract.new: file => '../resources/sample.pdf';

$extract.first = 0;
$extract.last = 2;
$extract.range: 0..1; 

say $extract.text;
say $extract.html;
say $extract.xml;
