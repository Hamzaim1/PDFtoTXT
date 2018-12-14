import pdftotext

# Charger le pdf
with open("lorem_ipsum.pdf", "rb") as f:
    pdf = pdftotext.PDF(f)

# Déchifrer le password de pdf s'il est chifré
with open("secure.pdf", "rb") as f:
    pdf = pdftotext.PDF(f, "secret")

# combien de page dans le pdf
print(len(pdf))

# afficher le contenus de tous les pages
for page in pdf:
    print(page)

# Lire la premiere et la deuxième page
print(pdf[0])
print(pdf[1])

# Lire tout le text dans une seule nom
print("\n\n".join(pdf[0]))
