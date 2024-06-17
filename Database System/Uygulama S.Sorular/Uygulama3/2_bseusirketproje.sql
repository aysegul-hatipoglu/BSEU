-- Create database
CREATE DATABASE BSEUSirket;
GO

-- Switch to the newly created database
USE BSEUSirket;
GO

-- Projeler Tablosu
CREATE TABLE Projeler (
    proje_id INT PRIMARY KEY,
    proje_adi VARCHAR(255),
    baslangic_tarihi DATE,
    bitis_tarihi DATE,
    aciklama TEXT,
    durum VARCHAR(50)
);

-- Görevler Tablosu
CREATE TABLE Gorevler (
    gorev_id INT PRIMARY KEY,
    gorev_adi VARCHAR(255),
    proje_id INT,
    aciklama TEXT,
    baslangic_tarihi DATE,
    bitis_tarihi DATE,
    durum VARCHAR(50),
    FOREIGN KEY (proje_id) REFERENCES Projeler(proje_id)
);

-- Çalýþanlar Tablosu
CREATE TABLE Calisanlar (
    calisan_id INT PRIMARY KEY,
    ad VARCHAR(255),
    soyad VARCHAR(255),
    email VARCHAR(255),
    telefon VARCHAR(20),
    departman VARCHAR(100)
);

-- Görev Atamalarý Tablosu
CREATE TABLE GorevAtamalari (
    atama_id INT PRIMARY KEY,
    gorev_id INT,
    calisan_id INT,
    FOREIGN KEY (gorev_id) REFERENCES Gorevler(gorev_id),
    FOREIGN KEY (calisan_id) REFERENCES Calisanlar(calisan_id)
);

INSERT INTO Projeler (proje_id, proje_adi, baslangic_tarihi, bitis_tarihi, aciklama, durum) VALUES
(1, 'Web Sitesi Yenileme', '2024-01-01', '2024-03-31', 'Firma web sitesi yenileniyor.', 'Tamamlandý'),
(2, 'Mobil Uygulama Geliþtirme', '2024-02-15', '2024-06-30', 'Yeni mobil uygulama geliþtiriliyor.', 'Devam Ediyor'),
(3, 'CRM Sistemi Entegrasyonu', '2024-03-10', '2024-05-15', 'Mevcut CRM sistemi ile entegrasyon yapýlýyor.', 'Devam Ediyor'),
(4, 'Yazýlým Güncellemesi', '2024-04-01', '2024-04-15', 'Yazýlýmýn güncellenmesi gerekiyor.', 'Açýk');


INSERT INTO Gorevler (gorev_id, gorev_adi, proje_id, aciklama, baslangic_tarihi, bitis_tarihi, durum) VALUES
(1, 'Tasarým Geliþtirme', 1, 'Yeni web sitesi tasarýmý yapýlacak.', '2024-01-10', '2024-01-31', 'Tamamlandý'),
(2, 'Veritabaný Yenileme', 1, 'Yeni veritabaný yapýsýnýn oluþturulmasý.', '2024-02-01', '2024-02-28', 'Tamamlandý'),
(3, 'iOS Uygulama Geliþtirme', 2, 'iOS platformu için mobil uygulama geliþtirilecek.', '2024-02-20', '2024-05-15', 'Devam Ediyor'),
(4, 'CRM API Entegrasyonu', 3, 'CRM sistemi ile özel entegrasyon API’leri geliþtirilecek.', '2024-03-20', '2024-04-30', 'Devam Ediyor'),
(5, 'Yazýlým Testleri', 4, 'Yazýlým test aþamalarý yapýlacak.', '2024-04-05', '2024-04-10', 'Devam Ediyor');


INSERT INTO Calisanlar (calisan_id, ad, soyad, email, telefon, departman) VALUES
(1, 'Ahmet', 'Yýlmaz', 'ahmet.yilmaz@example.com', '05001234567', 'Yazýlým Geliþtirme'),
(2, 'Mehmet', 'Demir', 'mehmet.demir@example.com', '05009876543', 'Grafik Tasarým'),
(3, 'Ayþe', 'Kaya', 'ayse.kaya@example.com', '05007654321', 'Mobil Uygulama Geliþtirme'),
(4, 'Fatma', 'Öz', 'fatma.oz@example.com', '05005432109', 'Proje Yönetimi'),
(5, 'Ali', 'Veli', 'ali.veli@example.com', '05003216547', 'Test ve Kalite Kontrol'),
(6, 'Zeynep', 'Tekin', 'zeynep.tekin@example.com', '05002123456', 'CRM Entegrasyon'),
(7, 'Canan', 'Aksu', 'canan.aksu@example.com', '05001928374', 'Veri Analizi'),
(8, 'Deniz', 'Yýldýz', 'deniz.yildiz@example.com', '05001827364', 'Destek Hizmetleri'),
(9, 'Emre', 'Ak', 'emre.ak@example.com', '05001726354', 'Mobil Uygulama Geliþtirme'),
(10, 'Elif', 'Kýr', 'elif.kir@example.com', '05001625344', 'Yazýlým Geliþtirme');


INSERT INTO GorevAtamalari (atama_id, gorev_id, calisan_id) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 3),
(4, 4, 6),
(5, 5, 10),
(6, 5, 8),
(7, 3, 8),
(8, 3, 7),
(9, 3, 8),
(10, 4, 5);
