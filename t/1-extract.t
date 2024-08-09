use Test;

use PDF::Extract;
use QueryOS;

my $os = OS.new;

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
if $os.is-windows {
    note "DEBUG: dumping \$text";
    note $eo.text;
}
else {
    cmp-ok $text, '~~', /:i quam/;
}


done-testing;

