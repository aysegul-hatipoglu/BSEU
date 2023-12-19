#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <time.h>



#define MAX_KELIME_UZUNLUGU 20


const char kelimeler[5][20] = {"bilgisayar", "bilecik", "insan", "kodlama", "sosyalmedya"};


//Bu fonksiyon elimizdeki diziden rasgele bir kelime seçer
const char *rasgeleKelimeSec() {
    int indeks = rand() % (sizeof(kelimeler) / sizeof(kelimeler[0]));
    return kelimeler[indeks];
}


int tahminKontrol(const char *kelime, char tahmin[], char harf) {
    int dogru = 0;

    for (int i = 0; i < strlen(kelime); i++) {
        if (kelime[i] == harf) {
            tahmin[i] = harf;
            dogru = 1;
        }
    }

    return dogru;
}

int main() {

    srand((unsigned int)time(NULL)); //rasgele sayi üretimi

    const char *hedefKelime = rasgeleKelimeSec();

    char tahmin[MAX_KELIME_UZUNLUGU];
    memset(tahmin, '*', strlen(hedefKelime));
    tahmin[strlen(hedefKelime)] = '\0';

    int devam = 1;
    char harf;

    printf("Kelimeyi tahmin etmeye hazir misiniz?\n");

    while (devam) {

        printf("Tahmin: %s\n", tahmin);

        printf("\nBir harf girin: ");
        scanf(" %c", &harf);

        harf = tolower(harf);//küçük harf fonksiyonu
        if (tahminKontrol(hedefKelime, tahmin, harf)) {
            printf("\n\nDogru tahmin!\n");
        } else {
            printf("\n\nYanlis tahmin. Tekrar deneyin.\n");
        }
        if (strcmp(tahmin, hedefKelime) == 0) {
            printf("Tebrikler! Kelimeyi dogru tahmin ettiniz. Kelime : %s\n", hedefKelime);
            devam = 0;
        }
    }
    return 0;
}
