cd "/home/nas02a/etudiants/inf/uapv1900224/Donnees_itinerantes/Papers"
mkdir -p text2/ 
mkdir -p info/ 
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

