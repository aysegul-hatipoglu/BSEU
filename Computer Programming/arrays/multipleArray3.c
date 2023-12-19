
//Degerlerinin kullanicinin girdiði 3*3 luk matris olustur ve en buyuk elemanýný bul

#include <stdio.h>

int main(){
	
	int max;
	int matris[3][3];
	
	int i,j;
	
	int toplam;
	
	for (i = 0 ; i < 3 ; i++){
		
		for ( j = 0 ; j < 3 ; j++){
			
			scanf ("%d" ,&matris[i][j]);
		}
	}
	
	max = matris[0][0];
	for (i = 0 ; i < 3 ; i++){
		
		for ( j = 0 ; j < 3 ; j++){
			
			if ( matris[i][j] > max ){
				
				max = matris[i][j];
			}
		}
	}
	
	printf ( "Matristeki en buyuk eleman : %d" ,max);
	
	return 0;
}
