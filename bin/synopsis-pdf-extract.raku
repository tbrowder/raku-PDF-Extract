#!/usr/bin/env raku
use lib '../lib';

use PDF::Extract;
use Data::Dump::Tree;

my $extract = Extract.new: file => '../resources/sample copy.pdf';

#$extract.first = 0;
#$extract.last = 2;
#$extract.range: 0..1;
#
#say $extract.text;
#say $extract.html;
#say $extract.xml;
#
#say $extract.so;   #test for PDF headers
say $extract.info;
ddt $extract.info<CreationDate>;
