use Test;

use PDF::Extract;

use QueryOS;
my $os = OS.new;

my $file = "t/sample.pdf".IO;
my $eo = Extract.new: :$file;
cmp-ok $eo.text, '~~', /\S+/; #:i quam/;

done-testing;
=finish

isa-ok $eo, PDF::Extract::Extract;

my $text = $eo.text;
say $text;
say "DEBUG: early exit";
exit;

cmp-ok $text, '~~', Str;

my $html = $eo.html;
cmp-ok $html, '~~', Str;

my $xml  = $eo.xml;
cmp-ok $xml, '~~', Str;

# test from the original version
# ok ($extract.text ~~ /quam/).so,            '.text';
if $os.is-windows {
    cmp-ok $text, '~~', /\S+/; #:i quam/;
    note "DEBUG: dumping \$text";
    note $eo.text;
    note $eo.html;
    note $eo.xml;
    note $eo.info;
}
else {
    cmp-ok $text, '~~', /:i quam/;
}

done-testing;

