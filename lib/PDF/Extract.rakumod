unit module PDF::Extract:ver<0.0.3>:auth<Steve Roe (librasteve@furnival.net)>;
#viz. https://linux.die.net/man/1/pdftotext
#viz. https://linux.die.net/man/1/pdftohtml
#viz. https://www.nu42.com/2014/09/scraping-pdf-documents-without-losing.html

class Extract is export {
    has $.file;
    has $.first is rw = 1;
    has $.last  is rw = 0;    #ie. all pages

    method range( Range:D $r ) {
        $!first = $r.min;
        $!last  = $r.max;
    }

    method text {
        qqx`pdftotext -f {$!first} -l {$!last} '{$.file}' -`
    }

    method html {
        qqx`pdftohtml -f {$!first} -l {$!last} -stdout '{$.file}'`
    }

    method xml {
        qqx`pdftohtml -f {$!first} -l {$!last} -stdout -xml '{$.file}'`
    }

    method so {
        qqx`pdfinfo '{$.file}'`.so
    }

    method info {
        if self.so {
            my @lines = qqx`pdfinfo '{ $.file }'`.lines;

            my %hash;
            for @lines -> $line {
                my ($k,$v) = $line.split(":");
                %hash{$k.trim} = $v.trim;
            }
            %hash;
        }
    }
}

# test support
sub load-sample-pdf is export {
    my $contents = slurp %?RESOURCES<sample.pdf>, :bin;
    spurt "$*HOME/sample.pdf", $contents;
}
sub drop-sample-pdf is export {
    unlink "$*HOME/sample.pdf";
}
