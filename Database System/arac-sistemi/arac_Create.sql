-- Araç türleri tablosu
CREATE TABLE AracTurleri (
    tur_kodu INT PRIMARY KEY,
    tur_adi VARCHAR(50)
);

-- Araç modelleri tablosu
CREATE TABLE AracModelleri (
    model_kodu INT PRIMARY KEY,
    model_adi VARCHAR(50),
    agirlik INT,
    yolcu_sayisi INT
);

-- Araçlar tablosu
CREATE TABLE Arac (
    sase_no VARCHAR(20) PRIMARY KEY,
    tur_kodu INT,
    model_kodu INT,
    uretim_tarihi DATE,
    renk VARCHAR(50),
    FOREIGN KEY (tur_kodu) REFERENCES AracTurleri(tur_kodu),
    FOREIGN KEY (model_kodu) REFERENCES AracModelleri(model_kodu)
);

-- Tedarikçi şirketler tablosu
CREATE TABLE Tedarikci (
    tedarikci_kodu INT PRIMARY KEY,
    sirket_adi VARCHAR(100),
    vergi_dairesi VARCHAR(100),
    vergi_numarasi VARCHAR(50)
);


-- Malzemeler tablosu
CREATE TABLE Malzemeler (
    malzeme_kodu INT PRIMARY KEY,
    malzeme_adi VARCHAR(50),
    stok_miktari INT,
    tedarikci_kodu INT,
    FOREIGN KEY (tedarikci_kodu) REFERENCES Tedarikci(tedarikci_kodu)
);


-- Araç-malzeme ilişkisi tablosu
CREATE TABLE AracMalzeme (
    sase_no VARCHAR(20),
    malzeme_kodu INT,
    miktar INT,
    PRIMARY KEY (sase_no, malzeme_kodu),
    FOREIGN KEY (sase_no) REFERENCES Arac(sase_no),
    FOREIGN KEY (malzeme_kodu) REFERENCES Malzemeler(malzeme_kodu)
);

