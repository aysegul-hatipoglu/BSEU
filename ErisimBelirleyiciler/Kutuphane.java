package ErisimBelirleyiciler;

class Kutuphane {
    // public değişken: Her yerden erişilebilir
    public String kutuphaneAdi;

    // protected değişken: Aynı paket veya alt sınıflardan erişilebilir
    protected String kutuphaneAdresi;

    // default (paket seviyesi) değişken: Sadece aynı paketten erişilebilir
    String acilisSaatleri;

    // private değişken: Yalnızca bu sınıf içerisinden erişilebilir
    private String gizliKod;

    // public yapıcı metot
    public Kutuphane(String kutuphaneAdi, String kutuphaneAdresi, String acilisSaatleri, String gizliKod) {
        this.kutuphaneAdi = kutuphaneAdi;
        this.kutuphaneAdresi = kutuphaneAdresi;
        this.acilisSaatleri = acilisSaatleri;
        this.gizliKod = gizliKod;
    }

    // private metot: Yalnızca bu sınıf içinde kullanılabilir
    private String getGizliKod() {
        return gizliKod;
    }

    // public metot: Her yerden erişilebilir
    public void kutuphaneBilgisiGoster() {
        System.out.println("Kütüphane Adı: " + kutuphaneAdi);
        System.out.println("Kütüphane Adresi: " + kutuphaneAdresi);
        System.out.println("Açılış Saatleri: " + acilisSaatleri);
        System.out.println("Gizli Kod: " + getGizliKod()); // Sadece sınıf içindeki private metoda erişim var
    }
}

class Kitap extends Kutuphane {
    // public değişken: Her yerden erişilebilir
    public String baslik;

    // protected değişken: Aynı paket veya alt sınıflardan erişilebilir
    protected String yazar;

    // default değişken: Sadece aynı paketten erişilebilir
    int yayinYili;

    // private değişken: Yalnızca bu sınıf içerisinden erişilebilir
    private String isbn;

    // public yapıcı metot
    public Kitap(String kutuphaneAdi, String kutuphaneAdresi, String acilisSaatleri, String gizliKod,
                 String baslik, String yazar, int yayinYili, String isbn) {
        super(kutuphaneAdi, kutuphaneAdresi, acilisSaatleri, gizliKod);
        this.baslik = baslik;
        this.yazar = yazar;
        this.yayinYili = yayinYili;
        this.isbn = isbn;
    }

    // private metot: Sadece bu sınıf içerisinde kullanılabilir
    private String getIsbn() {
        return isbn;
    }

    // protected metot: Alt sınıflar veya aynı paketten erişilebilir
    protected void yazarBilgisiGoster() {
        System.out.println("Yazar: " + yazar);
    }

    // public metot: Her yerden erişilebilir
    public void kitapBilgisiGoster() {
        System.out.println("Kitap Başlığı: " + baslik);
        System.out.println("Yayın Yılı: " + yayinYili);
        System.out.println("ISBN: " + getIsbn()); // Sadece sınıf içindeki private metoda erişim var
    }
}

class Main {
    public static void main(String[] args) {
        // Kutuphane sınıfı nesnesi oluşturma
        Kutuphane kutuphane = new Kutuphane("Merkez Kütüphane", "123 Kütüphane Cad.", "9:00 - 17:00", "Kut1234");
        kutuphane.kutuphaneBilgisiGoster(); // Her yerden erişilebilir, çünkü public

        // Kitap sınıfı nesnesi oluşturma
        Kitap kitap = new Kitap("Merkez Kütüphane", "123 Kütüphane Cad.", "9:00 - 17:00", "Kut1234",
                                "Java Programlama", "Ahmet Yılmaz", 2021, "978-3-16-148410-0");

        // Kitap nesnesinden bazı bilgilere erişim
        System.out.println("Kütüphane Adı: " + kitap.kutuphaneAdi); // public - her yerden erişilebilir
        System.out.println("Kütüphane Adresi: " + kitap.kutuphaneAdresi); // protected - aynı paket veya alt sınıf erişebilir
        System.out.println("Açılış Saatleri: " + kitap.acilisSaatleri); // default - aynı paket içindeyse erişilebilir
        // System.out.println("Gizli Kod: " + kitap.gizliKod); // Hata: private erişim belirleyici

        // Kitap bilgileri gösterme
        kitap.kitapBilgisiGoster(); // public metot - her yerden erişilebilir
        kitap.yazarBilgisiGoster(); // protected metot - aynı paket veya alt sınıftan erişilebilir
    }
}
