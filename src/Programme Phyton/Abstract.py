import os
import re

def afficher():
    for element in os.listdir('.'):
        if element.endswith('.txt'):
            fichier = open(element,"r")
            data = fichier.read()
            x = re.findall(r'Abstract(.*?)Introduction',data,re.DOTALL)
            x="".join(x).replace('\n',' ')
            print(x);

------------------------------------------------------------------------
print(afficher())