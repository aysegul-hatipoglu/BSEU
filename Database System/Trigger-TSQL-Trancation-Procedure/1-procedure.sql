-- Müşteri bilgilerini güncelleyen procedure
CREATE PROCEDURE MusteriBilgileriniGuncelle
    @MusteriID INT,
    @Ad VARCHAR(50),
    @Soyad VARCHAR(50),
    @DogumTarihi DATE,
    @Eposta VARCHAR(100),
    @Telefon VARCHAR(15)
AS
BEGIN
    UPDATE Musteriler
    SET Ad = @Ad, Soyad = @Soyad, DogumTarihi = @DogumTarihi, Eposta = @Eposta, Telefon = @Telefon
    WHERE MusteriID = @MusteriID;
END;


-- Mevcut müşteri bilgilerini güncelleme
EXEC MusteriBilgileriniGuncelle
    @MusteriID = 1,
    @Ad = 'Ahmetyeni',
    @Soyad = 'Yilmaz',
    @DogumTarihi = '1980-01-01',
    @Eposta = 'ahmet.yeni@example.com', -- E-posta adresi güncelleniyor
    @Telefon = '123-456-7899'; -- Telefon numarası güncelleniyor












-- Müşteri bilgilerini güncelleyen procedure
CREATE PROCEDURE BankaHesabiBakiyesiniGuncelle
    @HesapID INT,
    @YeniBakiye DECIMAL(18, 2)
AS
BEGIN
    UPDATE BankaHesaplari
    SET Bakiye = @YeniBakiye
    WHERE HesapID = @HesapID;
END;


select * from BankaHesaplari

-- Banka hesabı bakiyesini güncelleme
EXEC BankaHesabiBakiyesiniGuncelle @HesapID = 1, @YeniBakiye = 1500.00;

select * from BankaHesaplari
