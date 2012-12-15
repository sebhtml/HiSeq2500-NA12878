#!/bin/bash

if ! test $# = 2
then
	echo "Usage: $0 BaseSpace-Sample.txt BaseSpace-cookie.txt"
	exit
fi

sample=$1
cookie=$2

if ! test -f $sample
then
	echo "You must provide your BaseSpace sample"
	exit
fi

if ! test -f $cookie
then
	echo "You must provide your Illumina BaseSpace cookie (the name of the cookie is IComLogin)"
	exit
fi

for object in $(cat $sample)
do
	# just take the part with fastq
	fileName=$(for i in $(echo "$object"|sed 's=/= =g'|sed 's=?= =g'); do echo $i; done|grep fastq)

	curl --output $fileName --continue-at - --location \
		--cookie IComLogin=$(cat $cookie) "$object" &> $fileName.log &
done

