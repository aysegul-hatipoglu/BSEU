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

-- G�revler Tablosu
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

-- �al��anlar Tablosu
CREATE TABLE Calisanlar (
    calisan_id INT PRIMARY KEY,
    ad VARCHAR(255),
    soyad VARCHAR(255),
    email VARCHAR(255),
    telefon VARCHAR(20),
    departman VARCHAR(100)
);

-- G�rev Atamalar� Tablosu
CREATE TABLE GorevAtamalari (
    atama_id INT PRIMARY KEY,
    gorev_id INT,
    calisan_id INT,
    FOREIGN KEY (gorev_id) REFERENCES Gorevler(gorev_id),
    FOREIGN KEY (calisan_id) REFERENCES Calisanlar(calisan_id)
);

INSERT INTO Projeler (proje_id, proje_adi, baslangic_tarihi, bitis_tarihi, aciklama, durum) VALUES
(1, 'Web Sitesi Yenileme', '2024-01-01', '2024-03-31', 'Firma web sitesi yenileniyor.', 'Tamamland�'),
(2, 'Mobil Uygulama Geli�tirme', '2024-02-15', '2024-06-30', 'Yeni mobil uygulama geli�tiriliyor.', 'Devam Ediyor'),
(3, 'CRM Sistemi Entegrasyonu', '2024-03-10', '2024-05-15', 'Mevcut CRM sistemi ile entegrasyon yap�l�yor.', 'Devam Ediyor'),
(4, 'Yaz�l�m G�ncellemesi', '2024-04-01', '2024-04-15', 'Yaz�l�m�n g�ncellenmesi gerekiyor.', 'A��k');


INSERT INTO Gorevler (gorev_id, gorev_adi, proje_id, aciklama, baslangic_tarihi, bitis_tarihi, durum) VALUES
(1, 'Tasar�m Geli�tirme', 1, 'Yeni web sitesi tasar�m� yap�lacak.', '2024-01-10', '2024-01-31', 'Tamamland�'),
(2, 'Veritaban� Yenileme', 1, 'Yeni veritaban� yap�s�n�n olu�turulmas�.', '2024-02-01', '2024-02-28', 'Tamamland�'),
(3, 'iOS Uygulama Geli�tirme', 2, 'iOS platformu i�in mobil uygulama geli�tirilecek.', '2024-02-20', '2024-05-15', 'Devam Ediyor'),
(4, 'CRM API Entegrasyonu', 3, 'CRM sistemi ile �zel entegrasyon API�leri geli�tirilecek.', '2024-03-20', '2024-04-30', 'Devam Ediyor'),
(5, 'Yaz�l�m Testleri', 4, 'Yaz�l�m test a�amalar� yap�lacak.', '2024-04-05', '2024-04-10', 'Devam Ediyor');


INSERT INTO Calisanlar (calisan_id, ad, soyad, email, telefon, departman) VALUES
(1, 'Ahmet', 'Y�lmaz', 'ahmet.yilmaz@example.com', '05001234567', 'Yaz�l�m Geli�tirme'),
(2, 'Mehmet', 'Demir', 'mehmet.demir@example.com', '05009876543', 'Grafik Tasar�m'),
(3, 'Ay�e', 'Kaya', 'ayse.kaya@example.com', '05007654321', 'Mobil Uygulama Geli�tirme'),
(4, 'Fatma', '�z', 'fatma.oz@example.com', '05005432109', 'Proje Y�netimi'),
(5, 'Ali', 'Veli', 'ali.veli@example.com', '05003216547', 'Test ve Kalite Kontrol'),
(6, 'Zeynep', 'Tekin', 'zeynep.tekin@example.com', '05002123456', 'CRM Entegrasyon'),
(7, 'Canan', 'Aksu', 'canan.aksu@example.com', '05001928374', 'Veri Analizi'),
(8, 'Deniz', 'Y�ld�z', 'deniz.yildiz@example.com', '05001827364', 'Destek Hizmetleri'),
(9, 'Emre', 'Ak', 'emre.ak@example.com', '05001726354', 'Mobil Uygulama Geli�tirme'),
(10, 'Elif', 'K�r', 'elif.kir@example.com', '05001625344', 'Yaz�l�m Geli�tirme');


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
