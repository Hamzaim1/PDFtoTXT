cd "/home/nas02a/etudiants/inf/uapv1900224/Donnees_itinerantes/Papers"
mkdir -p text1/ 
mkdir -p info1/ 
for i in *.pdf
do
	echo $i
	
	echo "<acticle>" >> "info1/$i.xml"
	echo "<preamble>" $i "</preamble>" >> "info1/$i.xml"
	
	pdf2txt -o "text1/$i.txt" "$i"
	
	echo "<titre>" >> "info1/$i.xml"
	sed -n '1,2p' "text1/$i.txt" >> "info1/$i.xml"
	echo "</titre>" >> "info1/$i.xml"
	
	echo "<abstract>" >> "info1/$i.xml"
	cat "text1/$i.txt" | sed -n '/Abstract/,/Introduction/p' | sed -e  's:.*<Abstract>::' | sed -e 's:<Introduction>.*::'  >> "info1/$i.xml"
	echo "</abstract>" >> "info1/$i.xml"
	
	echo "</acticle>" >> "info1/$i.xml"
done
