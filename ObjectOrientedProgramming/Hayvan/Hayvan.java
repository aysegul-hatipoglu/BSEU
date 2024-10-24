package Hayvan;


public class Hayvan {
    // Hayvanın özellikleri (Nitelikler)
    String isim;
    String tur;
    int yas;
    String ses;  // Hayvanın çıkardığı ses

    // Yapıcı metot (Constructor)
    public Hayvan(String isim, String tur1, int yas, String ses) {
        this.isim = isim;  
        tur = tur1;    
        this.yas = yas;    
        this.ses = ses;    
    }

    // Hayvanın bilgilerini yazdıran bir metot
    public void bilgileriGoster() {
        System.out.println("Hayvanın Adı: " + isim);
        System.out.println("Türü: " + tur);
        System.out.println("Yaşı: " + yas);
        System.out.println("Çıkardığı Ses: " + ses);
    }

    // Hayvanın ses çıkarmasını sağlayan metot
    public void sesCikar() {
        System.out.println(isim + " ses çıkarıyor: " + ses +"\n\n");
    }

    // Main metodu - Programın başladığı yer
    public static void main(String[] args) {
      
        Hayvan hayvan1 = new Hayvan("Leo", "Köpek", 5, "Hav Hav");
        hayvan1.bilgileriGoster();
        
       
        hayvan1.sesCikar();
        Hayvan hayvan2 = new Hayvan("Paticik", "Kedi", 3, "Miyav");
        
        hayvan2.bilgileriGoster();
        hayvan2.sesCikar();
    }
}
