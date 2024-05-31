
select * from BankaHesaplari
select * from HesapIslemleri
select * from Musteriler


-- Aşağıdaki Transaction 1 id'li hesaptan 300TL para çekme işlemi yapmaktadır.

BEGIN TRANSACTION;

DECLARE @HesapID INT = 1;  -- Çekim yapılacak hesap ID'si
DECLARE @CekimTutari DECIMAL(18, 2) = 300.00;  -- Çekilecek tutar
DECLARE @GuncelBakiye DECIMAL(18, 2);

BEGIN TRY
    -- Mevcut bakiye kontrolü
    SELECT @GuncelBakiye = Bakiye
    FROM BankaHesaplari
    WHERE HesapID = @HesapID;
    
    IF @GuncelBakiye < @CekimTutari
    BEGIN
        -- Eğer bakiye yetersizse hata mesajı oluştur ve işlemi geri al
        THROW 50000, 'Yetersiz bakiye. İşlem gerçekleştirilemedi.', 1;
    END

    -- HesapIslemleri tablosuna para çekme işlemi ekle
    INSERT INTO HesapIslemleri (HesapID, IslemTuru, Tutar, Aciklama)
    VALUES (@HesapID, 'Cekme', @CekimTutari, 'ATM cekme');
    
    -- Bakiye güncellemesi tetikleyici tarafından yapılacaktır
    COMMIT;

    PRINT 'Para çekme işlemi başarıyla gerçekleştirildi.';
    
END TRY
BEGIN CATCH
    -- Hata durumunda işlemi geri al
    ROLLBACK;
    
    -- Hata mesajını yazdır
    PRINT 'İşlem sırasında bir hata oluştu: ' + ERROR_MESSAGE();
END CATCH;
