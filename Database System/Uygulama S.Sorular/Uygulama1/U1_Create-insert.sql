CREATE DATABASE U1_UrunlerDB;

USE U1_UrunlerDB;

CREATE TABLE kategoriler (
    KategoriID INT PRIMARY KEY,
    KategoriAdi VARCHAR(50)
);

CREATE TABLE urunler (
    UrunID INT PRIMARY KEY,
    KategoriID INT,
    UrunAdi VARCHAR(50),
    Fiyat DECIMAL(5, 2),
    FOREIGN KEY (KategoriID) REFERENCES kategoriler(KategoriID)
);

CREATE TABLE satislar (
    SatisID INT PRIMARY KEY,
    UrunID INT,
    SatisMiktari INT,
    FOREIGN KEY (UrunID) REFERENCES urunler(UrunID)
);

CREATE TABLE tedarikciler (
    TedarikciID INT PRIMARY KEY,
    TedarikciAdi VARCHAR(50),
    UrunID INT,
    FOREIGN KEY (UrunID) REFERENCES urunler(UrunID)
);

INSERT INTO kategoriler (KategoriID, KategoriAdi) VALUES
(1, 'Meyve'),
(2, 'Sebze');

INSERT INTO urunler (UrunID, KategoriID, UrunAdi, Fiyat) VALUES
(1, 1, 'Elma', 5.0),
(2, 1, 'Muz', 8.0),
(3, 1, 'Portakal', 6.0),
(4, 2, 'Domates', 4.0),
(5, 2, 'Salatalık', 3.0),
(6, 2, 'Biber', 7.0);

INSERT INTO satislar (SatisID, UrunID, SatisMiktari) VALUES
(1, 1, 100),
(2, 2, 150),
(3, 3, 80),
(4, 4, 200),
(5, 5, 180),
(6, 6, 120);

INSERT INTO tedarikciler (TedarikciID, TedarikciAdi, UrunID) VALUES
(1, 'Tedarikci A', 1),
(2, 'Tedarikci B', 2),
(3, 'Tedarikci C', 3),
(4, 'Tedarikci D', 4),
(5, 'Tedarikci E', 5),
(6, 'Tedarikci F', 6);

