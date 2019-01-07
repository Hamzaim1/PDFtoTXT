#!/bin/bash
cd "/home/nas02a/etudiants/inf/uapv1900224/Donnees_itinerantes/Papers"
mkdir -p text1/ 
mkdir -p info1/ 


if [ $1 = "-x" ]
then
	for i in *.pdf
	do
	if [ $2 = "$i" ]
		then
		echo $i

		echo "<acticle>" >> "info1/$i.xml"
		echo "<preamble>" $i "</preamble>" >> "info1/$i.xml"

		pdf2txt -o "text1/$i.txt" "$i"

		echo "<titre>" >> "info1/$i.xml"
		sed -n '1,2p' "text1/$i.txt" >> "info1/$i.xml"
		echo "</titre>" >> "info1/$i.xml"

		echo "<abstract>" >> "info1/$i.xml"
		cat "text1/$i.txt" | sed -n '/Abstract/,/Introduction/p' | sed -e  's:.*<Abstract>::' | sed -e 's:<Introduction>.*::'  >> "info1/$i.xml"
		cat "text1/$i.txt" | sed -n '/ABSTRACT/,/INTRODUCTION/p' | sed -e  's:.*<ABSTRACT>::' | sed -e 's:<INTRODUCTION>.*::'  >> "info1/$i.xml"
		
		echo "</abstract>" >> "info1/$i.xml"
		
		echo "<bibliographie>" >> "info1/$i.xml"
		cat "text1/$i.txt" | sed -n '/References/,/aaa/p' | sed -e  's:.*<References>::' | sed -e 's:<aaa>.*::'  >> "info1/$i.xml"
		cat "text1/$i.txt" | sed -n '/REFERENCES/,/aaa/p' | sed -e  's:.*<References>::' | sed -e 's:<aaa>.*::'  >> "info1/$i.xml"
		echo "</bibliographie>" >> "info1/$i.xml"
		
		echo "<Conclusion>" >> "info1/$i.xml"
		cat "text1/$i.txt" | sed -n '/Conclusion/,/References/p' | sed -e  's:.*<Conclusion>::' | sed -e 's:<References>.*::'  >> "info1/$i.xml"
		cat "text1/$i.txt" | sed -n '/CONCLUSION/,/REFERENCES/p' | sed -e  's:.*<CONCLUSION>::' | sed -e 's:<REFERENCES>.*::'  >> "info1/$i.xml"
		echo "</Conclusion>" >> "info1/$i.xml"
		
		echo "<Discussion>" >> "info1/$i.xml"
		cat "text1/$i.txt" | sed -n '/Discussion/,/Conclusion/p' | sed -e  's:.*<Discussion>::' | sed -e 's:<References>.*::'  >> "info1/$i.xml"
		cat "text1/$i.txt" | sed -n '/CONCLUSION/,/REFERENCES/p' | sed -e  's:.*<CONCLUSION>::' | sed -e 's:<REFERENCES>.*::'  >> "info1/$i.xml"
		echo "</Discussion>" >> "info1/$i.xml"

		echo "</acticle>" >> "info1/$i.xml"
		fi
	done

elif [ $1 = "-t" ]
then
	for i in *.pdf
	do
		echo $i
		
		echo le nom de fichier est: $i >> "info1/$i.txt"

		pdf2txt -o "text1/$i.txt" "$i"

		echo Le titre de la recherche est: >> "info1/$i.txt"
		sed -n '1,2p' "text1/$i.txt" >> "info1/$i.txt"

		echo L'abstract de l'auteur est: >> "info1/$i.txt"
		cat "text1/$i.txt" | sed -n '/Abstract/,/Introduction/p' | sed -e  's:.*<Abstract>::' | sed -e 's:<Introduction>.*::'  >> "info1/$i.txt"
		cat "text1/$i.txt" | sed -n '/ABSTRACT/,/INTRODUCTION/p' | sed -e  's:.*<ABSTRACT>::' | sed -e 's:<INTRODUCTION>.*::'  >> "info1/$i.txt"
		
		cat "text1/$i.txt" | sed -n '/References/,/aaa/p' | sed -e  's:.*<References>::' | sed -e 's:<aaa>.*::'  >> "info1/$i.txt"
		cat "text1/$i.txt" | sed -n '/REFERENCES/,/aaa/p' | sed -e  's:.*<References>::' | sed -e 's:<aaa>.*::'  >> "info1/$i.txt"
		
	done
elif [ $1 = "-b" ]
then
		for i in *.pdf
	do
	#extraction du xml
		echo $i

		echo "<acticle>" >> "info1/$i.xml"
		echo "<preamble>" $i "</preamble>" >> "info1/$i.xml"

		pdf2txt -o "text1/$i.txt" "$i"

		echo "<titre>" >> "info1/$i.xml"
		sed -n '1,2p' "text1/$i.txt" >> "info1/$i.xml"
		echo "</titre>" >> "info1/$i.xml"

		echo "<abstract>" >> "info1/$i.xml"
		cat "text1/$i.txt" | sed -n '/Abstract/,/Introduction/p' | sed -e  's:.*<Abstract>::' | sed -e 's:<Introduction>.*::'  >> "info1/$i.xml"
		cat "text1/$i.txt" | sed -n '/ABSTRACT/,/INTRODUCTION/p' | sed -e  's:.*<ABSTRACT>::' | sed -e 's:<INTRODUCTION>.*::'  >> "info1/$i.xml"
		
		echo "</abstract>" >> "info1/$i.xml"
		
		echo "<bibliographie>" >> "info1/$i.xml"
		cat "text1/$i.txt" | sed -n '/References/,/aaa/p' | sed -e  's:.*<References>::' | sed -e 's:<aaa>.*::'  >> "info1/$i.xml"
		cat "text1/$i.txt" | sed -n '/REFERENCES/,/aaa/p' | sed -e  's:.*<References>::' | sed -e 's:<aaa>.*::'  >> "info1/$i.xml"
		echo "</bibliographie>" >> "info1/$i.xml"

		echo "</acticle>" >> "info1/$i.xml"
		
		
		
		#extraction de text
		echo le nom de fichier est: $i >> "info1/$i.txt"
		
		echo Le titre de la recherche est: >> "info1/$i.txt"
		sed -n '1,2p' "text1/$i.txt" >> "info1/$i.txt"

		echo L'abstract de l'auteur est: >> "info1/$i.txt"
		cat "text1/$i.txt" | sed -n '/Abstract/,/Introduction/p' | sed -e  's:.*<Abstract>::' | sed -e 's:<Introduction>.*::'  >> "info1/$i.txt"
		cat "text1/$i.txt" | sed -n '/ABSTRACT/,/INTRODUCTION/p' | sed -e  's:.*<ABSTRACT>::' | sed -e 's:<INTRODUCTION>.*::'  >> "info1/$i.txt"
		
		cat "text1/$i.txt" | sed -n '/References/,/aaa/p' | sed -e  's:.*<References>::' | sed -e 's:<aaa>.*::'  >> "info1/$i.txt"
		cat "text1/$i.txt" | sed -n '/REFERENCES/,/aaa/p' | sed -e  's:.*<References>::' | sed -e 's:<aaa>.*::'  >> "info1/$i.txt"
	done
else 	
        echo "Entrer une bonne option"
fi

