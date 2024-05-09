-- Araç türleri tablosu
INSERT INTO AracTurleri (tur_kodu, tur_adi) VALUES
(1, 'Otomobil'),
(2, 'Kamyon'),
(3, 'Minibüs'),
(4, 'Motosiklet'),
(5, 'Kamyonet'),
(6, 'Otobüs'),
(7, 'Arazi aracı'),
(8, 'Tır'),
(9, 'Panelvan'),
(10, 'Elektrikli araç');

-- Araç modelleri tablosu
INSERT INTO AracModelleri (model_kodu, model_adi, agirlik, yolcu_sayisi) VALUES
(1, 'Sedan', 1500, 5),
(2, 'Kamyon 12 Tekerlek', 8000, 3),
(3, 'Midibüs', 3500, 15),
(4, 'Spor Motosiklet', 200, 2),
(5, 'Kamyonet', 2000, 2),
(6, 'Şehir Otobüsü', 10000, 40),
(7, 'SUV', 2200, 7),
(8, 'Arazi Jeep', 1800, 4),
(9, 'Çekici', 7000, 2),
(10, 'Elektrikli Hatchback', 1600, 5);

-- Araçlar tablosu
INSERT INTO Arac (sase_no, tur_kodu, model_kodu, uretim_tarihi, renk) VALUES
('ABC123', 1, 1, '2023-01-15', 'Siyah'),
('DEF456', 2, 2, '2023-03-20', 'Kırmızı'),
('GHI789', 3, 3, '2023-05-10', 'Beyaz'),
('JKL012', 4, 4, '2023-06-25', 'Mavi'),
('MNO345', 5, 5, '2023-07-12', 'Gri'),
('PQR678', 6, 6, '2023-09-30', 'Sarı'),
('STU901', 7, 7, '2023-10-18', 'Turuncu'),
('VWX234', 8, 8, '2023-11-05', 'Yeşil'),
('YZA567', 9, 9, '2023-12-22', 'Kahverengi'),
('BCD890', 10, 10, '2024-02-08', 'Bordo');

-- Tedarikçi şirketler tablosu
INSERT INTO Tedarikci (tedarikci_kodu, sirket_adi, vergi_dairesi, vergi_numarasi) VALUES
(1, 'Örnek Tedarik A.Ş.', 'İstanbul', '1234567890'),
(2, 'Tedarikçi Ltd. Şti.', 'Ankara', '0987654321'),
(3, 'Malzeme Ticaret A.Ş.', 'İzmir', '5678901234'),
(4, 'Güvenilir Tedarikçi A.Ş.', 'Bursa', '4321098765'),
(5, 'Yedek Parça Tic. Ltd. Şti.', 'Adana', '6789012345');

-- Malzemeler tablosu
INSERT INTO Malzemeler (malzeme_kodu, malzeme_adi, stok_miktari, tedarikci_kodu) VALUES
(1, 'Lastik', 500, 1),
(2, 'Motor Yağı', 300, 2),
(3, 'Far Ampulü', 200, 3),
(4, 'Direksiyon Simidi', 150, 4),
(5, 'Cam Silecekleri', 400, 5),
(6, 'Akü', 250, 1),
(7, 'Fren Balatası', 350, 2),
(8, 'Radyatör', 180, 3),
(9, 'Kapı Kolu', 200, 4),
(10, 'Egzoz Borusu', 120, 5);

-- Araç-malzeme ilişkisi tablosu
INSERT INTO AracMalzeme (sase_no, malzeme_kodu, miktar) VALUES
('ABC123', 1, 4),
('DEF456', 2, 1),
('GHI789', 3, 8),
('JKL012', 4, 2),
('MNO345', 5, 3),
('PQR678', 6, 1),
('STU901', 7, 2),
('VWX234', 8, 5),
('YZA567', 9, 3),
('BCD890', 10, 1);
