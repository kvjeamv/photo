
cd ./source
set files [ glob -directory . *.jpg ]

set i 0

foreach a_file $files {

    puts "$a_file --> $i.jpg"
	file rename $a_file $i.jpg
	incr i
}

