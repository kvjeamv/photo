
set files [ glob -directory . *.jpg ]

foreach a_file $files {
    set fileName [ file rootname $a_file ]
    if [ file exists ./renamed/$a_file] {
        set i 0
        while {1} {
            set fileName ${fileName}_$i
            if ![ file exists ./renamed/$fileName.jpg ] {
                break
            }
            incr i 1
        }
    }
    puts "$fileName"
    file rename $a_file ./renamed/$fileName.jpg
}
