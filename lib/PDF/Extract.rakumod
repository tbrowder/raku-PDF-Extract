unit class PDF::Extract;

#viz. https://linux.die.net/man/1/pdftotext
#viz. https://linux.die.net/man/1/pdftohtml
#viz. https://www.nu42.com/2014/09/scraping-pdf-documents-without-losing.html

#use QueryOS;
#my $os = OS.new;

has $.file is required;
has $.first is rw = 1;
has $.last  is rw = 0;    #ie. all pages

=begin comment
method range( Range:D $r ) {
    $!first = $r.min;
    $!last  = $r.max;
}
=end comment

method text {
    my $proc  = run("pdftotext", '-f', $!first, '-l', $!last, 
                    $!file, '-', :out);
    my $s = $proc.out.slurp(:close).lines.join("");;
    $s
}

=finish
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
        Map.new: qqx`pdfinfo '{ $.file }'`.lines.map(*.split(":", 2)>>.trim.pairup)
    }
}
