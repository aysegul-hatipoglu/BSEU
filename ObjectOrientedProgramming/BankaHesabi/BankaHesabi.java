package BankaHesabi;

class BankaHesabi {
    // Statik değişken: tüm hesaplar arasındaki toplam bakiye
    static double toplamBakiye = 0.0;

    // Her banka hesabına özgü özellikler
    private String hesapNo;
    private double bakiye;

    // Yapıcı metot: yeni bir hesap oluştururken bakiye eklenir ve toplam bakiye güncellenir
    public BankaHesabi(String hesapNo, double bakiye) {
        this.hesapNo = hesapNo;
        this.bakiye = bakiye;
        toplamBakiye += bakiye;
    }

    // Para yatırma metodu
    public void paraYatir(double miktar) {
        if (miktar > 0) {
            bakiye += miktar;
            toplamBakiye += miktar;
            System.out.println(miktar + " TL yatırıldı. Yeni bakiye: " + bakiye + " TL");
        } else {
            System.out.println("Geçersiz miktar.");
        }
    }

    // Para çekme metodu
    public void paraCek(double miktar) {
        if (miktar > 0 && miktar <= bakiye) {
            bakiye -= miktar;
            toplamBakiye -= miktar;
            System.out.println(miktar + " TL çekildi. Yeni bakiye: " + bakiye + " TL");
        } else {
            System.out.println("Yetersiz bakiye veya geçersiz miktar.");
        }
    }

    // Hesap bilgilerini gösteren metod
    public void hesapBilgisiGoster() {
        System.out.println("Hesap No: " + hesapNo + ", Bakiye: " + bakiye + " TL");
    }

    // Statik metod: Toplam bakiyeyi gösterir
    public static void toplamBakiyeyiGoster() {
        System.out.println("Tüm hesapların toplam bakiyesi: " + toplamBakiye + " TL");
    }
}

 class Musteri {
    public static void main(String[] args) {
    	 // İki farklı banka hesabı oluşturuyoruz
        BankaHesabi hesap1 = new BankaHesabi("Hesap1000", 5000.0);
        BankaHesabi hesap2 = new BankaHesabi("Hesap2000", 3000.0);

        // Hesap bilgilerini ve toplam bakiyeyi gösteriyoruz
        hesap1.hesapBilgisiGoster();
        hesap2.hesapBilgisiGoster();
        BankaHesabi.toplamBakiyeyiGoster();

        // İlk hesaba para yatırma işlemi
        hesap1.paraYatir(1500.0);
        BankaHesabi.toplamBakiyeyiGoster();

        // İkinci hesaptan para çekme işlemi
        hesap2.paraCek(1000.0);
        BankaHesabi.toplamBakiyeyiGoster();

        // Güncellenmiş bakiye ve toplam bakiyeyi tekrar gösteriyoruz
        hesap1.hesapBilgisiGoster();
        hesap2.hesapBilgisiGoster();
        BankaHesabi.toplamBakiyeyiGoster();
    }
}
