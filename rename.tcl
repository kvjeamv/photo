#!/usr/bin/tclsh

if { $argc < 1 } {
  puts "Usage: $argv0 directory-name!!!"
  exit
}

set numOfBytes 5000
set files [ lsort [ glob -directory [ lindex $argv 0 ] *.{jpg,JPG} ] ]
#foreach aFile $files {
#  puts "$i:$aFile"
#}
#exit

foreach aFile $files {
  set fileHandle [ open $aFile r ]
  fconfigure $fileHandle -translation binary

  binary scan [ read $fileHandle $numOfBytes ] a* str
  close $fileHandle

  set size [ format %010d [ file size $aFile ] ]
  if [ regexp {(\d+):(\d+):(\d+)\s+(\d+):(\d+):(\d+)} $str -> year month date hour min sec ] {
    set fileName "$year$month$date$hour$min${sec}_$size"
    lappend aFiles($fileName) $aFile
  } else {
    set fileName yyyymmdd$j
    incr j 1
  }
}

foreach aKey [ array name aFiles ] {
  set dir [ string range $aKey 0 5 ]  
  puts $dir
}







exit

set i 0
set j 0
foreach a_name [ array names aFiles ] {
	set i 0
	if { [ llength $aFiles($a_name) ] == 1 } {
		puts "$aFiles($a_name) -> $a_name"
		file rename $aFiles($a_name) $a_name.jpg
	} else {
		foreach aFile $aFiles($a_name) {
			puts "$aFile -> ${a_name}_$i"
			file rename $aFile ${a_name}_$i.jpg
			incr i
		}
	}
}
