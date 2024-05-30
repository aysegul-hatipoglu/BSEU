CREATE DATABASE BankaVeritabani;
GO

USE BankaVeritabani;
GO

-- Musteriler Tablosu
CREATE TABLE Musteriler (
    MusteriID INT PRIMARY KEY IDENTITY(1,1),
    Ad VARCHAR(50) NOT NULL,
    Soyad VARCHAR(50) NOT NULL,
    DogumTarihi DATE,
    Eposta VARCHAR(100) UNIQUE,
    Telefon VARCHAR(15)
);

-- Banka Hesaplari Tablosu
CREATE TABLE BankaHesaplari (
    HesapID INT PRIMARY KEY IDENTITY(1,1),
    MusteriID INT NOT NULL,
    HesapNumarasi VARCHAR(20) UNIQUE NOT NULL,
    HesapTuru VARCHAR(20) NOT NULL,
    Bakiye DECIMAL(18, 2) DEFAULT 0.00,
    OlusturmaTarihi DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (MusteriID) REFERENCES Musteriler(MusteriID)
);

-- Hesap Islemleri Tablosu
CREATE TABLE HesapIslemleri (
    IslemID INT PRIMARY KEY IDENTITY(1,1),
    HesapID INT NOT NULL,
    IslemTarihi DATETIME DEFAULT GETDATE(),
    IslemTuru VARCHAR(20) NOT NULL CHECK (IslemTuru IN ('Yatirma', 'Cekme')),
    Tutar DECIMAL(18, 2) NOT NULL,
    Aciklama VARCHAR(255),
    FOREIGN KEY (HesapID) REFERENCES BankaHesaplari(HesapID)
);


INSERT INTO Musteriler (Ad, Soyad, DogumTarihi, Eposta, Telefon)
VALUES 
('Ahmet', 'Yilmaz', '1980-01-01', 'ahmet.yilmaz@example.com', '123-456-7890'),
('Ayse', 'Kaya', '1990-05-15', 'ayse.kaya@example.com', '987-654-3210');


INSERT INTO BankaHesaplari (MusteriID, HesapNumarasi, HesapTuru, Bakiye)
VALUES 
(1, '1234567890', 'Vadesiz', 1000.00),
(1, '0987654321', 'Vadeli', 2500.00),
(2, '1122334455', 'Vadesiz', 1500.00);

INSERT INTO HesapIslemleri (HesapID, IslemTuru, Tutar, Aciklama)
VALUES 
(1, 'Yatirma', 500.00, 'Ilk yatirma'),
(1, 'Cekme', 200.00, 'ATM cekme'),
(2, 'Yatirma', 1000.00, 'Maas yatirma'),
(3, 'Cekme', 300.00, 'Fatura odeme');
