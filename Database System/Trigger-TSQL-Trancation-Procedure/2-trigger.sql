select * from BankaHesaplari
select * from HesapIslemleri
select * from Musteriler




-- Müşteriler tablosuna bir kayıt eklendiğinde Müşteri log tablosuna o kayda ait verileri ekleyen trigger
CREATE TRIGGER trg_MusteriEklemeLog
ON Musteriler
AFTER INSERT
AS
BEGIN
    INSERT INTO MusteriLog (MusteriID, Aciklama)
    SELECT inserted.MusteriID, Ad +'  ismide yeni müşteri eklendi'
    FROM inserted;
END;


-- Müşteriler tablosunda bir kayıt güncellendiğinde Müşteri log tablosuna o kayda ait verileri ekleyen trigger
CREATE TRIGGER trg_MusteriUpdate
ON Musteriler
AFTER UPDATE
AS
BEGIN
    INSERT INTO MusteriLog (MusteriID, Aciklama)
    SELECT DELETED.MusteriID, DELETED.Ad +'  müşterisi güncellendi'
	FROM DELETED;
END;






-- Değişiklik kontrolü
select * from MusteriLog
select * from Musteriler

INSERT INTO Musteriler (Ad, Soyad, DogumTarihi, Eposta, Telefon)
VALUES ('Test Kaydı', 'Velidsdsd', '1985-07-10', 'ali.veli@example.cim', '555-987-6544');
-- Değişiklik kontrolü
select * from MusteriLog
select * from Musteriler




-- Hesap işlemleri tablosunda para çekme ya da yatırma işlemi gerçekleştiğinde Hesap detaylarında bakiye bilgilerini güncelleyen trigger

CREATE TRIGGER trg_BakiyeGuncelle
ON HesapIslemleri
AFTER INSERT
AS
BEGIN
    DECLARE @HesapID INT, @IslemTuru VARCHAR(20), @Tutar DECIMAL(18, 2);
    
    SELECT @HesapID = inserted.HesapID, 
           @IslemTuru = inserted.IslemTuru, 
           @Tutar = inserted.Tutar
    FROM inserted;

    IF @IslemTuru = 'Yatirma'
    BEGIN
        UPDATE BankaHesaplari
        SET Bakiye = Bakiye + @Tutar
        WHERE HesapID = @HesapID;
    END
    ELSE IF @IslemTuru = 'Cekme'
    BEGIN
        UPDATE BankaHesaplari
        SET Bakiye = Bakiye - @Tutar
        WHERE HesapID = @HesapID;
    END
END;



select * from BankaHesaplari
select * from HesapIslemleri
select * from Musteriler

-- Aşağıdaki işlemler yapılarak trigger test edilebilir.
INSERT INTO HesapIslemleri (HesapID, IslemTuru, Tutar, Aciklama)
VALUES  (2, 'Cekme', 500.00, 'PAra yatirma');

INSERT INTO HesapIslemleri (HesapID, IslemTuru, Tutar, Aciklama)
VALUES(1, 'Cekme', 200.00, 'ATM cekme');

INSERT INTO HesapIslemleri (HesapID, IslemTuru, Tutar, Aciklama)
VALUES(2, 'Yatirma', 1000.00, 'Maas yatirma');

INSERT INTO HesapIslemleri (HesapID, IslemTuru, Tutar, Aciklama)
VALUES(2, 'Cekme', 300.00, 'Fatura odeme');