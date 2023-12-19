
//Degerlerinin kullanicinin girdiði 3*3 luk matris olustur ve transpozunu bul

#include <stdio.h>

int main(){
	
	int matris[3][3], transpose[3][3];
	
	int i,j;
	
	int toplam;
	
	for (i = 0 ; i < 3 ; i++){
		
		for ( j = 0 ; j < 3 ; j++){
			
			scanf ("%d" ,&matris[i][j]);
		}
	}
	
	printf( "Matris\n");
	for (i = 0; i < 3 ; i++){
		
		for (j = 0; j < 3 ; j++){
			
			printf("%d " ,matris[i][j]);
			
		}
		
		printf("\n");
	}
	
	printf ("Matrisin transpozu \n");
	for (i = 0; i < 3 ; i++){
		
		for (j = 0; j < 3 ; j++){
			
			transpose[j][i] = matris [i][j];
			
		}
		
	}
	
	for (i = 0; i < 3 ; i++){
		
		for (j = 0; j < 3 ; j++){
			
			printf("%d " ,transpose[i][j]);
			
		}
		
		printf("\n");
	}
	
	
	return 0;
}
