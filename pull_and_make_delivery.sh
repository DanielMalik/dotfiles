#!/bin/bash -ue

# fetch origin master

IFS=" "

git fetch --all

echo "Fetched."
# check diff

#files=`git diff --diff-filter=AM --name-only origin/master | perl -ne "print if (m|(..)-(..)| || m|blacklist.txt| || m|whitelist.txt|)" | sort -u`
files=`git diff --diff-filter=AM --name-only origin/master | perl -ne "print if (m|(..)-(..)|)" | sort -u`

#git reset --hard origin/master

files_quantity=`echo "$files" | wc -l`
for ((i=1; i<="$files_quantity"; i++)); 
do 

	echo $i; 
	echo "$files" | sed -n "$i"p; 

	language=`echo "$files" | sed -n "$i"p | awk -F"." '{print $1}' | awk -F"-" '{ print $2 FS $3 }'`
	echo "L: $language"

done


if [ "$files" != "" ]; then

	while read -r FILE
	do	
		echo -e "$FILE"
		language=`echo -e "$FILE" | awk -F"." '{print $1}' | awk -F"-" '{ print $2 FS $3 }'`		
		echo "SCND LOOP L: $language"
	done < <(echo -e "$files")
fi

echo "files $files"
version_file=`git diff --diff-filter=AM --name-only master origin/master | perl -ne "print if (m|version.info|)"`
echo "vf $version_file"
#new_version=`git diff origin/master version.info`
new_version=`git diff -R origin/master version.info | perl -ne "print if (m|\+test-(..)-(..)|)" | awk -F. '{print $1 FS $2 FS $3 }'`

echo "new version $new_version"
#while read -r FILE
#do
#	echo "file $FILE"
#done

