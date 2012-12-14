#!/bin/bash

if ! test -f BaseSpace-IComLogin.txt
then
	echo "You must provide your Illumina BaseSpace cookie (the name of the cookie is IComLogin) in BaseSpace-IComLogin.txt"
	exit
fi

for object in $(cat RawFiles.txt)
do
	# just take the part with fastq
	fileName=$(for i in $(echo "$object"|sed 's=/= =g'|sed 's=?= =g'); do echo $i; done|grep fastq)

	curl --output $fileName --continue-at - --location \
		--cookie IComLogin=$(cat BaseSpace-IComLogin.txt) "$object" &> $fileName.log &
done

