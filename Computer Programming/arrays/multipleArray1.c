// Cok boyutlu dizi ve matris tanimi

#include <stdio.h>

int main(){
	
	int a;
	int b[3];
	int c[3][4];
	int d [2][3][4];
	
	/*  Matris
		1 2 3
		4 5 6
		7 8 9
	*/
	
	int matris[3][3] = {{1,2,3},{4,5,6},{7,8,9}};
	//int matris[3][3] = {1,2,3,4,5,6,7,8,9};
	
	int i,j;
	
	for (i = 0; i < 3 ; i++){
		
		for (j = 0; j < 3 ; j++){
			
			printf("%d " ,matris[i][j]);
			
		}
		
		printf("\n");
	}
	
	
	int matris2[3][3];
	
	for (i = 0; i < 3 ; i++){
		
		for (j = 0; j < 3 ; j++){
			
			scanf("%d" ,&matris2[i][j]);
			
		}
	}
	
	for (i = 0; i < 3 ; i++){
		
		for (j = 0; j < 3 ; j++){
			
			printf("%d " ,matris2[i][j]);
			
		}
		
		printf("\n");
	}
	return 0;
}
