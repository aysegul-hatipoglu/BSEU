USE BSEURestoran;
GO

-----1.Soru
BEGIN TRANSACTION;

DECLARE @bakiye DECIMAL(10, 2) = 60

BEGIN TRY

    DECLARE @toplam_fiyat DECIMAL(10, 2);
    SELECT @toplam_fiyat = fiyat FROM Menu WHERE menu_id = 1;
	SELECT @toplam_fiyat = @toplam_fiyat + fiyat * 2 FROM Menu WHERE menu_id = 4;

    IF  @bakiye <@toplam_fiyat
	BEGIN
		THROW 50000, 'Yetersiz bakiye. İşlem gerçekleştirilemedi.', 1;
	END

	PRINT 'Para çekme işlemi başarıyla gerçekleştirildi.';
    
    -- İşlemi başarılı olarak tamamlayın
    COMMIT TRANSACTION;
    PRINT 'Transaction başarılı bir şekilde tamamlandı.';
END TRY
BEGIN CATCH
    -- Hata oluştuğunda işlemi geri alın
    ROLLBACK TRANSACTION;
    PRINT 'Transaction sırasında bir hata oluştu ve işlem geri alındı: ' + ERROR_MESSAGE();
END CATCH;
GO




----------------------------------2.Soru
USE BSEURestoran;
GO

-- Saklı Yordam Oluşturma
CREATE PROCEDURE YeniMenuEkle
    @urun_adi VARCHAR(255),
    @kategori VARCHAR(255),
    @fiyat DECIMAL(10, 2)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @menu_id INT;
    SELECT @menu_id = ISNULL(MAX(menu_id), 0) + 1 FROM Menu;

    -- Yeni bir ürün ekleyin
    INSERT INTO Menu (menu_id, urun_adi, kategori, fiyat)
    VALUES (@menu_id, @urun_adi, @kategori, @fiyat);

    PRINT 'Yeni ürün başarılı bir şekilde menüye eklendi.';
END
GO

EXEC YeniMenuEkle
    @urun_adi = 'Makarna',
    @kategori = 'Ana Yemek',
    @fiyat = 25.00;

select * from Menu






----------------------------------3.Soru
USE BSEURestoran;
GO

-- View Oluşturma
USE BSEURestoran;
GO

-- View Oluşturma
CREATE VIEW DoluMasalarMusteriYemekBilgileri AS
SELECT
    M.masa_id,
    M.masa_numarasi,
    R.musteri_adi,
    Menu.urun_adi,
    Menu.fiyat
FROM
    Masa M
JOIN
    Rezervasyon R ON M.masa_id = R.masa_id
JOIN
    Siparis S ON R.rezervasyon_id = S.rezervasyon_id
JOIN
    Menu ON S.menu_id = Menu.menu_id
WHERE
    M.durum = 'Dolu';
GO

select * from DoluMasalarMusteriYemekBilgileri
