use Test;

use PDF::Extract;

my $file = "t/sample.pdf".IO;
my $eo = Extract.new: :$file;

isa-ok $eo, PDF::Extract::Extract;

my $text = $eo.text;
cmp-ok $text, '~~', Str;

my $html = $eo.html;
cmp-ok $html, '~~', Str;

my $xml  = $eo.xml;
cmp-ok $xml, '~~', Str;

# test from the original version
# ok ($extract.text ~~ /quam/).so,            '.text';
cmp-ok $text, '~~', /quam/;


done-testing;

