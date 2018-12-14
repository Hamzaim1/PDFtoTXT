




cd "/home/nas02a/etudiants/inf/uapv1900103/Donnees_itinerantes/Bureau/Papers"
mkdir text
mkdir info
mkdir information
for i in *.pdf
do
echo 
pdftotext -layout -raw "" "text/.txt"
sed -n '/References/,/aaa/P' "text/.txt" >> "info/.txt"
sed -n '/REFERENCES/,/aaa/P' "text/.txt" >> "info/.txt"


 
done

