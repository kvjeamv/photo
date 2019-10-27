
set files [ glob -directory . *.jpg ]

set i 0
foreach a_file $files {
    set fileName a$i.jpg
    puts "$fileName"
    file rename $a_file $fileName
    incr i 1
}
