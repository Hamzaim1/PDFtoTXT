/*#include <time.h>
#include <stdio.h>
int main(void) {

    clock_t tStart = clock();

    for (int i = 0; i < 10000; ++i)
	{
	printf("");
	for (int j = 0; j < 10000; ++j)
	{
		printf("");
	}
	}
    printf("Time taken: %.2fs\n", (double)(clock() - tStart)/CLOCKS_PER_SEC);
    return 0;
}*/

#include <iostream>
#include <fstream>
#include <time.h>
#include <stdio.h>
using namespace std;
 
int main()
{
	
        ifstream fichier("tp1-3.txt", ios::in);  // on ouvre en lecture
 
        if(fichier)  // si l'ouverture a fonctionné
        {
                string ligne;  // déclaration d'une chaîne qui contiendra la ligne lue
                while(getline(fichier, ligne))  // tant que l'on peut mettre la ligne dans "contenu"
        		{
                cout << ligne << endl;  // on l'affiche
        		}
 
                fichier.close();
        }
        else
                cerr << "Impossible d'ouvrir le fichier !" << endl;
 
 		
        return 0;
}

