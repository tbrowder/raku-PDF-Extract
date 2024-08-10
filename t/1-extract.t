use Test;

use QueryOS;

use PDF::Extract;

my $os = OS.new;

# The input PDF
my $file = "t/sample.pdf".IO;

#=begin comment
my $cmd = "pdftotext $file '-'";
my $proc  = run "pdftotext", $file, '-', :out;
my $s = $proc.out.slurp(:close);
cmp-ok $s, '~~', /:i quam/;
#=end comment

=begin comment
my $eo = PDF::Extract.new: :$file;
is $eo.text.contains("quam"), True;
=end comment

done-testing;

=finish

#my $eo = Extract.new: :$file;
cmp-ok $eo.text, '~~', /\S+/; #:i quam/;


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

