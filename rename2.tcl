
set files [ glob -directory . * ]

set i 0
foreach a_file $files {
	if [ file isdirectory $a_file ] {
		puts "$a_file:"
		
		set subfiles [ glob -directory $a_file *.jpg ]
		
		foreach a_subfile $subfiles {
			puts "$a_subfile"
			file rename $a_subfile $i.jpg
			incr i
		}

	}
}