
CREATE DATABASE BSEURestoran;
GO

USE BSEURestoran;
GO

-- Masa Tablosu
CREATE TABLE Masa (
    masa_id INT PRIMARY KEY,
    masa_numarasi INT,
    kisi_sayisi INT,
    durum VARCHAR(50)
);

-- Rezervasyon Tablosu
CREATE TABLE Rezervasyon (
    rezervasyon_id INT PRIMARY KEY,
    masa_id INT,
    musteri_adi VARCHAR(255),
    rezervasyon_tarihi DATE,
    FOREIGN KEY (masa_id) REFERENCES Masa(masa_id)
);

-- Menü Tablosu
CREATE TABLE Menu (
    menu_id INT PRIMARY KEY,
    urun_adi VARCHAR(255),
    kategori VARCHAR(255),
    fiyat DECIMAL(10, 2)
);

-- Sipariþ Tablosu
CREATE TABLE Siparis (
    siparis_id INT PRIMARY KEY,
    rezervasyon_id INT,
    menu_id INT,
    miktar INT,
    toplam_fiyat DECIMAL(10, 2),
    FOREIGN KEY (rezervasyon_id) REFERENCES Rezervasyon(rezervasyon_id),
    FOREIGN KEY (menu_id) REFERENCES Menu(menu_id)
);


INSERT INTO Masa (masa_id, masa_numarasi, kisi_sayisi, durum) VALUES
(1, 101, 4, 'Bos'),
(2, 102, 2, 'Rezerve'),
(3, 103, 4, 'Dolu'),
(4, 104, 6, 'Bos'),
(5, 105, 4, 'Rezerve'),
(6, 106, 2, 'Dolu'),
(7, 107, 8, 'Bos')



INSERT INTO Rezervasyon (rezervasyon_id, masa_id, musteri_adi, rezervasyon_tarihi) VALUES (1, 1, 'Ali Yılmaz', '2024-06-06 19:00');
INSERT INTO Rezervasyon (rezervasyon_id, masa_id, musteri_adi, rezervasyon_tarihi) VALUES (2, 2, 'Ayşe Demir', '2024-06-07 20:00');
INSERT INTO Rezervasyon (rezervasyon_id, masa_id, musteri_adi, rezervasyon_tarihi) VALUES (3, 3, 'Mehmet Ak', '2024-06-08 18:30');
INSERT INTO Rezervasyon (rezervasyon_id, masa_id, musteri_adi, rezervasyon_tarihi) VALUES (4, 4, 'Fatma Öz', '2024-06-09 21:00');
INSERT INTO Rezervasyon (rezervasyon_id, masa_id, musteri_adi, rezervasyon_tarihi) VALUES (5, 5, 'Ahmet Kaya', '2024-06-10 19:30');

INSERT INTO Menu (menu_id, urun_adi, kategori, fiyat) VALUES
(1, 'Kebap', 'Ana Yemek', 45.00),
(2, 'Lahmacun', 'Ana Yemek', 20.00),
(3, 'Ayran', 'içecek', 5.00),
(4, 'Baklava', 'Tatli', 25.00),
(5, 'Künefe', 'Tatli', 28.00)


INSERT INTO Siparis (siparis_id, rezervasyon_id, menu_id, miktar, toplam_fiyat) VALUES
(1, 1, 1, 2, 90.00),
(2, 2, 3, 1, 15.00),
(3, 3, 5, 3, 24.00),
(4, 4, 2, 4, 80.00),
(5, 5, 4, 1, 18.00)

