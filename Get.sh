for object in $(cat RawFiles.txt)
do
	# just take the part with fastq
	fileName=$(for i in $(echo "$object"|sed 's=/= =g'|sed 's=?= =g'); do echo $i; done|grep fastq)

	curl --output $fileName --continue-at - --location \
		--cookie IComLogin=$(cat ~/123) "$object" &> $fileName.log &
done

