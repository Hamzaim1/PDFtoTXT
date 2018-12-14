#!/bin/bash
cd "/home/nas02a/etudiants/inf/uapv1900224/Donnees_itinerantes/Papers"
mkdir -p text2/ 
mkdir -p info2/ 


if [ $1 = "-x" ]
then
	for i in *.pdf
	do
		echo $i

		echo "<acticle>" >> "info2/$i.xml"
		echo "<preamble>" $i "</preamble>" >> "info2/$i.xml"

		pdftotext -f 1 -l 2 "$i" "text2/$i.txt"

		echo "<titre>" >> "info2/$i.xml"
		sed -n '1,2p' "text2/$i.txt" >> "info2/$i.xml"
		echo "</titre>" >> "info2/$i.xml"

		echo "<abstract>" >> "info2/$i.xml"
		cat "text1/$i.txt" | sed -n '/Abstract/,/Introduction/p' | sed -e  's:.*<Abstract>::' | sed -e 's:<Introduction>.*::'  >> "info1/$i.xml"
		cat "text1/$i.txt" | sed -n '/ABSTRACT/,/INTRODUCTION/p' | sed -e  's:.*<ABSTRACT>::' | sed -e 's:<INTRODUCTION>.*::'  >> "info1/$i.xml"
		
		echo "</abstract>" >> "info2/$i.xml"
		
		echo "<bibliographie>" >> "info2/$i.xml"
		cat "text2/$i.txt" | sed -n '/References/,/aaa/p' | sed -e  's:.*<References>::' | sed -e 's:<aaa>.*::'  >> "info2/$i.xml"
		cat "text2/$i.txt" | sed -n '/REFERENCES/,/aaa/p' | sed -e  's:.*<References>::' | sed -e 's:<aaa>.*::'  >> "info2/$i.xml"
		echo "</bibliographie>" >> "info2/$i.xml"

		echo "</acticle>" >> "info1/$i.xml"
	done

elif [ $1 = "-t" ]
then
	for i in *.pdf
	do
		echo $i
		echo le nom de fichier est: $i >> "info/$i.txt"
		
		pdftotext -f 1 -l 2 "$i" "text2/$i.txt"
		
		echo Le titre de la recherche est: >> "info/$i.txt"
		sed -n '1,2p' "text2/$i.txt" >> "info/$i.txt"
		
		echo L'abstract de l'auteur est: >> "info/$i.txt"
		cat "text2/$i.txt" | sed -n '/Abstract/,/Introduction/p' | sed -e  's:.*<Abstract>::' | sed -e 's:<Introduction>.*::'  >> "info/$i.txt"

	done
else 	
        echo "Entrer une bonne option"
fi

