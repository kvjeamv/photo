
cd further

set files [ glob -directory . * ]

set i 0
foreach a_file $files {
	if [ regexp {(\d+)_0} [ file rootname [ file tail $a_file ] ] -> newName ] {
		puts "$a_file -> $newName"
		file rename $a_file $newName.jpg
	} else {
		puts "$a_file -> delete"
		file delete $a_file
	}
}