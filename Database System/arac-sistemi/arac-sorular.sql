1-----
SELECT model_adi, agirlik FROM AracModelleri WHERE agirlik > 2000;

2-----
SELECT stok_miktari, sirket_adi FROM Malzemeler
INNER JOIN Tedarikci ON Malzemeler.tedarikci_kodu = Tedarikci.tedarikci_kodu
WHERE malzeme_adi = 'Lastik';

3----
SELECT COUNT(*) FROM Arac WHERE tur_kodu = (SELECT tur_kodu FROM AracTurleri WHERE tur_adi = 'Minibüs');

4----
SELECT malzeme_adi, MAX(stok_miktari) AS max_stok FROM Malzemeler;

5----
SELECT sase_no, SUM(miktar) AS toplam_malzeme_miktari FROM AracMalzeme GROUP BY sase_no;

6----
SELECT model_adi, renk FROM Arac
INNER JOIN AracModelleri ON Arac.model_kodu = AracModelleri.model_kodu
WHERE sase_no = 'ABC123';

7----
SELECT Malzemeler.malzeme_adi, AracMalzeme.miktar FROM AracMalzeme
INNER JOIN Malzemeler ON AracMalzeme.malzeme_kodu = Malzemeler.malzeme_kodu
WHERE sase_no = 'DEF456';

8---
SELECT Arac.sase_no, AracModelleri.model_adi, Arac.uretim_tarihi, Arac.renk
FROM Arac
INNER JOIN AracModelleri ON Arac.model_kodu = AracModelleri.model_kodu;

9----
SELECT *
FROM Arac
INNER JOIN AracModelleri ON Arac.model_kodu = AracModelleri.model_kodu
WHERE AracModelleri.agirlik > 2000;

10----
SELECT *
FROM Arac
INNER JOIN AracModelleri ON Arac.model_kodu = AracModelleri.model_kodu
WHERE AracModelleri.yolcu_sayisi > 5;

11--
SELECT Malzemeler.malzeme_adi, AracMalzeme.miktar
FROM AracMalzeme
INNER JOIN Malzemeler ON AracMalzeme.malzeme_kodu = Malzemeler.malzeme_kodu
WHERE AracMalzeme.sase_no = 'PQR678';

12---
SELECT Tedarikci.sirket_adi
FROM Malzemeler
INNER JOIN Tedarikci ON Malzemeler.tedarikci_kodu = Tedarikci.tedarikci_kodu
WHERE Malzemeler.malzeme_kodu = '1';

ekstra-cozum
--SELECT malzeme_adi, stok_miktari AS max_stok FROM Malzemeler
--WHERE stok_miktari = (SELECT MAX(stok_miktari) FROM Malzemeler);
