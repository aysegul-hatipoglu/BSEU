SELECT * from Kategoriler
SELECT * from Satislar
SELECT * from tedarikciler
SELECT * from Urunler

--  1-Soru:  Trigger oluşturma
CREATE TRIGGER StokGuncelleme
ON satislar
AFTER INSERT
AS
BEGIN
    DECLARE @UrunID INT, @SatisMiktari INT;

    SELECT @UrunID = INSERTED.UrunID, @SatisMiktari = INSERTED.SatisMiktari
    FROM INSERTED;

    UPDATE urunler
    SET StokMiktari = StokMiktari - @SatisMiktari
    WHERE UrunID = @UrunID;
END;




-- Yeni satış ekleme
INSERT INTO satislar (SatisID, UrunID, SatisMiktari) VALUES (7, 1, 30);

select * from satislar
select * from urunler




--- 2. soru---TedarikciID, TedarikciAdi, ve UrunID parametrelerini alan ve tedarikciler tablosuna yeni bir tedarikçi ekleyen ve işlem başarılı yazan bir procedure yazın 
---A

CREATE PROCEDURE TedarikciEkle
    @TedarikciID INT,
    @TedarikciAdi VARCHAR(50),
    @UrunID INT
AS
BEGIN
     -- Yeni tedarikçi ekleme
    INSERT INTO tedarikciler (TedarikciID, TedarikciAdi, UrunID)
    VALUES (@TedarikciID, @TedarikciAdi, @UrunID);
END;

select * from tedarikciler

EXEC TedarikciEkle @TedarikciID = 7, @TedarikciAdi = 'Portakal Tedarikçisi', @UrunID = 3;



---3.soru

CREATE VIEW UrunBilgileri AS
SELECT
    u.UrunID,
    u.UrunAdi,
    k.KategoriAdi,
    t.TedarikciAdi,
    u.Fiyat,
    u.StokMiktari,
    ISNULL(SUM(s.SatisMiktari), 0) AS ToplamSatisMiktari
FROM
    urunler u
     JOIN kategoriler k ON u.KategoriID = k.KategoriID
    LEFT JOIN tedarikciler t ON u.UrunID = t.UrunID
    LEFT JOIN satislar s ON u.UrunID = s.UrunID
GROUP BY
    u.UrunID,
    u.UrunAdi,
    k.KategoriAdi,
    t.TedarikciAdi,
    u.Fiyat,
    u.StokMiktari;


SELECT * FROM UrunBilgileri;

select * from tedarikciler