unit class PDF::Extract;

#viz. https://linux.die.net/man/1/pdftotext
#viz. https://linux.die.net/man/1/pdftohtml
#viz. https://www.nu42.com/2014/09/scraping-pdf-documents-without-losing.html

use QueryOS;
my $os = OS.new;

#class Extract is export {

    has $.file is required;
    has $.first is rw = 1;
    has $.last  is rw = 0;    #ie. all pages

=finish

    method range( Range:D $r ) {
        $!first = $r.min;
        $!last  = $r.max;
    }

    method text {
        if $os.is-windows {
            my $proc  = run "pdftotext", '-f', $!first, '-l', $!last, 
                            $!file, '-', :out;
            $proc.out.slurp(:close);
        }
        else {
            #qqx`pdftotext -f {$!first} -l {$!last} '{$!file}' -`
            my $proc  = run "pdftotext", '-f', $!first, '-l', $!last, 
                            $!file, '-', :out;
            $proc.out.slurp(:close);
        }
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
