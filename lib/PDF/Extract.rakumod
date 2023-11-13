unit module PDF::Extract:ver<0.0.1>:auth<Steve Roe (librasteve@furnival.net)>;
#viz. https://linux.die.net/man/1/pdftotext
#viz. https://www.nu42.com/2014/09/scraping-pdf-documents-without-losing.html

class Extract is export {
    has $.file;

    method text {
        qqx`pdftotext {$!file} -`
    }

    method html {
        qqx`pdftohtml -stdout {$!file}`
    }

    method xml {
        qqx`pdftohtml -stdout -xml {$!file}`
    }
}


sub my-sample-pdf is export {
    %?RESOURCES<sample.pdf>.absolute
}
