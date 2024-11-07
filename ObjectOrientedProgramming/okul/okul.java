package okul;

public class okul {

	static String okulAdi = "Atatürk Lisesi";
    static String okulAdresi = "Bursa, Türkiye";


    private String ogrenciAdi;
    private String ogrenciSoyadi;
    private int ogrenciNumarasi;


    public okul(String ogrenciAdi, String ogrenciSoyadi, int ogrenciNumarasi) {
        this.ogrenciAdi = ogrenciAdi;
        this.ogrenciSoyadi = ogrenciSoyadi;
        this.ogrenciNumarasi = ogrenciNumarasi;
    }


    public void ogrenciBilgisiGoster() {
        System.out.println("Öğrenci Adı: " + ogrenciAdi);
        System.out.println("Öğrenci Soyadı: " + ogrenciSoyadi);
        System.out.println("Öğrenci Numarası: " + ogrenciNumarasi);
        System.out.println("Okul Adı: " + okulAdi);
        System.out.println("Okul Adresi: " + okulAdresi);
        System.out.println("-----------------------------");
    }

  
    public static void okulBilgileriniGuncelle(String yeniOkulAdi, String yeniOkulAdresi) {
        okulAdi = yeniOkulAdi;
        okulAdresi = yeniOkulAdresi;
    }

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        okul ogrenci1 = new okul("Ali","Aslan", 101);
        okul ogrenci2 = new okul("Sümeyye", "Ay", 102);

        // Öğrenci bilgilerini gösteriyoruz (okul adı ve adresi statik olduğu için her iki öğrenci için de aynı)
        ogrenci1.ogrenciBilgisiGoster();
        ogrenci2.ogrenciBilgisiGoster();

        // Okul bilgilerini güncelliyoruz
        okul.okulBilgileriniGuncelle("Kadıköy Lisesi", "İstanbul, Türkiye");

        // Güncellenmiş okul bilgilerini tekrar gösteriyoruz
        ogrenci1.ogrenciBilgisiGoster();

        ogrenci2.ogrenciBilgisiGoster();
    }
}

