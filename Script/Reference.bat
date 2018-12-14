
cd "/home/nas02a/etudiants/inf/uapv1900103/Donnees_itinerantes/Bureau/Papers"
mkdir text
mkdir info
mkdir information
for i in *.pdf
do
	echo $i
	pdftotext -layout -f 1 -raw "$i" "text/$i.txt"
	sed -n '/Abstract/,/Introduction/p' "text/$i.txt" >> "info/$i.txt"
	sed '$d' "info/$i.txt" >> "information/$i.txt"
	rm -rf info
	rm -rf text


	 
done
