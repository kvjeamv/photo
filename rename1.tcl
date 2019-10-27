
set NUM 5000
set files [ glob -directory ./source *.jpg ]

set i 0
set j 0

foreach a_file $files {
    set fileHandle [ open $a_file r ]
    fconfigure $fileHandle -translation binary

    binary scan [ read $fileHandle $::NUM ] a* str
    close $fileHandle
    if ![ regexp {(\d+):(\d+):(\d+)\s+(\d+):(\d+):(\d+)} $str -> year mon date hour min sec ] {
        set fileName yyyymmdd$j
        incr j 1
    } else {
        set fileName $year$mon$date$hour$min$sec
    }
    if [ file exists $fileName.jpg ] {
        set fileName ${fileName}_$i
        incr i 1
    }
    puts "$a_file --> $fileName"
    #file rename $a_file $fileName.jpg
}





