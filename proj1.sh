#!/bin/sh
traverse() {
	echo "<ul>" >> $2
	echo "<li>${1}</li>" >> $2
	if [ -d "${1}" ]
	then
		for dir in "${1}"/*
		do
			if [ -r "$dir" ]
			then
				traverse $dir $2
			fi
		done
	fi
	echo "</ul>" >> $2
}
if [ "$#" -ne 2 ]
then
	echo "Invalid number of arguments"
	exit 1
else
	file=$2
	> $file
	echo "<!DOCTYPE html>" >> $file 
	echo "<html>" >> $file
	echo "<body>" >> $file
	echo "<h1>Directory Tree</h1>" >> $file 
	traverse $1 $file
	echo "</body>" >> $file
	echo "</html>" >> $file
fi
