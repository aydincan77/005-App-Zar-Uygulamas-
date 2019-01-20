//
//  ViewController.swift
//  Zar
//
//  Created by Aydın Can on 15.12.2018.
//  Copyright © 2018 CAN Soft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Outlet bağlantılarını yap.
    @IBOutlet weak var oyuncuİkiÇevirBtnOut: UIButton!
    @IBOutlet weak var oyuncuİkiMesajLblOut: UILabel!
    @IBOutlet weak var oyunBaşlaBtnOut: UIButton!
    @IBOutlet weak var oyunMesajLblOut: UILabel!
    @IBOutlet weak var oyuncuBirMesajLblOut: UILabel!
    @IBOutlet weak var oyuncuBirÇevirBtnOut: UIButton!
    @IBOutlet weak var oyuncuİkiSkorLblOut: UILabel!
    @IBOutlet weak var oyuncuBirSkorLblOut: UILabel!
    @IBOutlet weak var zarBirImgOut: UIImageView!
    @IBOutlet weak var zarİkiImgOut: UIImageView!
    @IBOutlet weak var skorBelirleTxtOut: UITextField!
    @IBOutlet weak var oyuncuBirBitirBtnOut: UIButton!
    @IBOutlet weak var oyuncuİkiBitirBtnOut: UIButton!
    
    // Zar değerlerini belirle
    let zarDeğer = (1...6)
    
    // Taraf sayısını belirle
    let kimdenBaşlasınDeğer = (1...2)
    
    // Sıra, İlk Skor ve hedef skor belirle
    var sıraKimde = 0
    var oyuncuBirSkor = 0
    var oyuncuİkiSkor = 0
    var hedefSkor = "200"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Açılış kontrollerini göster
        oyunBaşlaBtnOut.isHidden = false
        oyunMesajLblOut.isHidden = false
        skorBelirleTxtOut.isHidden = false
        print("Açılış kontrolleri yüklendi.")
        
        // Ana ekran İlk değerlerini yaz
        skorBelirleTxtOut.text = "\(hedefSkor)"
        oyunMesajLblOut.text = "Merhaba, Oyuna başlamak için bir hedef skor belirleyin ve 'Oyuna Başla' düğmesine basınız!"
        print("Ana ekran İlk değerler yüklendi.")
        
        // Birinci oyuncu kontrollerini gizle
        oyuncuBirSkorLblOut.isHidden = true
        oyuncuBirMesajLblOut.isHidden = true
        oyuncuBirÇevirBtnOut.isHidden = true
        oyuncuBirBitirBtnOut.isHidden = true
        print("1. oyuncu kontrolleri gizlendi.")
        
        // ikinci oyuncu kontrollerini gizle
        oyuncuİkiSkorLblOut.isHidden = true
        oyuncuİkiMesajLblOut.isHidden = true
        oyuncuİkiÇevirBtnOut.isHidden = true
        oyuncuİkiBitirBtnOut.isHidden = true
        print("2. oyuncu kontrolleri gizlendi.")
        
        // Zar kontrollerini gizle
        zarBirImgOut.isHidden = true
        zarİkiImgOut.isHidden = true
        print("Zarlar gizlendi.")

        // Buton köşelerini yuvarlat
        oyuncuBirBitirBtnOut.layer.cornerRadius = oyuncuBirBitirBtnOut.frame.height / 2
        oyuncuBirÇevirBtnOut.layer.cornerRadius = oyuncuBirÇevirBtnOut.frame.height / 2
        oyuncuİkiÇevirBtnOut.layer.cornerRadius = oyuncuBirBitirBtnOut.frame.height / 2
        oyuncuİkiBitirBtnOut.layer.cornerRadius = oyuncuİkiBitirBtnOut.frame.height / 2
        oyunBaşlaBtnOut.layer.cornerRadius = oyunBaşlaBtnOut.frame.height / 2
        print("Buton Köşeleri yuvarlatıldı.")
        
        // İkinci oyuncunun kontrollerini ters çevir
        oyuncuİkiBitirBtnOut.transform = CGAffineTransform(rotationAngle: 180/90 * (CGFloat.pi / 2))
        oyuncuİkiÇevirBtnOut.transform = CGAffineTransform(rotationAngle: 180/90 * (CGFloat.pi / 2))
        oyuncuİkiSkorLblOut.transform = CGAffineTransform(rotationAngle: 180/90 * (CGFloat.pi / 2))
        oyuncuİkiMesajLblOut.transform = CGAffineTransform(rotationAngle: 180/90 * (CGFloat.pi / 2))
        print("2. oyuncu kontrolleri 180 derece ters çevrildi.")
        
        // Kontrollere gölge ekle, fontu ayarla ve arkaplanı renklendir
        oyunBaşlaBtnOut.layer.shadowOffset = CGSize(width: 0, height: 10)
        oyunBaşlaBtnOut.layer.shadowOpacity = 0.5
        oyunBaşlaBtnOut.backgroundColor = UIColor(displayP3Red: 0.16, green: 0.28, blue: 0.66, alpha: 1.0)
        oyuncuBirÇevirBtnOut.layer.shadowOffset = CGSize(width: 0, height: 10)
        oyuncuBirÇevirBtnOut.layer.shadowOpacity = 0.5
        oyuncuBirÇevirBtnOut.backgroundColor = UIColor(displayP3Red: 0.16, green: 0.28, blue: 0.66, alpha: 1.0)
        oyuncuİkiÇevirBtnOut.layer.shadowOffset = CGSize(width: 0, height: 10)
        oyuncuİkiÇevirBtnOut.layer.shadowOpacity = 0.5
        oyuncuİkiÇevirBtnOut.backgroundColor = UIColor(displayP3Red: 0.16, green: 0.28, blue: 0.66, alpha: 1.0)
        zarBirImgOut.layer.shadowOffset = CGSize(width: 0, height: 20)
        zarBirImgOut.layer.shadowOpacity = 0.5
        zarİkiImgOut.layer.shadowOffset = CGSize(width: 0, height: 20)
        zarİkiImgOut.layer.shadowOpacity = 0.5
        skorBelirleTxtOut.textColor = UIColor(displayP3Red: 0.16, green: 0.28, blue: 0.66, alpha: 1.0)
        skorBelirleTxtOut.font = UIFont(name: "Helvetica", size: 40.0)
        print("Kontrollere gölge eklendi, Skor belirleme font'u ve size'ı ayarlandı, arkaplanlar renklendirildi.")

    }

    @IBAction func OyunaBaşlaBtnAct(_ sender: UIButton) {
        
        // Klavye açıksa gizle
        skorBelirleTxtOut.resignFirstResponder()
        print("Klavye gizlendi.")
        
        // Oyunun kimden başlayacağına karar ver ve hafızaya al
        let kimdenBaşlasın = kimdenBaşlasınDeğer.randomElement()!
        sıraKimde = kimdenBaşlasın
        print("Rastgele seçim yapıldı. Oyun : \(sıraKimde). oyuncu ile başlıyor")
        
        // İlk değerleri yaz
        oyuncuBirSkorLblOut.text = "0"
        oyuncuİkiSkorLblOut.text = "0"
        hedefSkor = skorBelirleTxtOut.text!
        zarBirImgOut.image = UIImage(named: "6.png")
        zarİkiImgOut.image = UIImage(named: "6.png")
        print("Hedef skor : \(hedefSkor) olarak ayarlandı. İlk değerler yazıldı.")
        
        // Eğer Birinci oyuncu seçilirse;
        if sıraKimde == 1 {
            print("1. oyuncu seçildi. Kontroller ayarlanıyor.")
            
            // Birinci oyuncu kontrollerini göster
            oyuncuBirSkorLblOut.isHidden = false
            oyuncuBirMesajLblOut.isHidden = true
            oyuncuBirÇevirBtnOut.isHidden = false
            oyuncuBirBitirBtnOut.isHidden = false
            
            // ikinci oyuncu kontrollerini gizle
            oyuncuİkiSkorLblOut.isHidden = false
            oyuncuİkiMesajLblOut.isHidden = true
            oyuncuİkiÇevirBtnOut.isHidden = true
            oyuncuİkiBitirBtnOut.isHidden = true
            
            // Zar resimlerini göster
            zarBirImgOut.isHidden = false
            zarİkiImgOut.isHidden = false
            
            // Açılış kontrollerini gizle
            oyunBaşlaBtnOut.isHidden = true
            oyunMesajLblOut.isHidden = true
            skorBelirleTxtOut.isHidden = true
            
            print("1. oyuncu seçilmişti. Kontroller ayarlandı.")
        } else {
            print("2. oyuncu seçildi. Kontroller ayarlanıyor.")
            
            // Birinci oyuncu kontrollerini gizle
            oyuncuBirSkorLblOut.isHidden = false
            oyuncuBirMesajLblOut.isHidden = true
            oyuncuBirÇevirBtnOut.isHidden = true
            oyuncuBirBitirBtnOut.isHidden = true
            
            // ikinci oyuncu kontrollerini göster
            oyuncuİkiSkorLblOut.isHidden = false
            oyuncuİkiMesajLblOut.isHidden = true
            oyuncuİkiÇevirBtnOut.isHidden = false
            oyuncuİkiBitirBtnOut.isHidden = false
            
            // Zar resimlerini göster
            zarBirImgOut.isHidden = false
            zarİkiImgOut.isHidden = false

            // Açılış kontrollerini gizle
            oyunBaşlaBtnOut.isHidden = true
            oyunMesajLblOut.isHidden = true
            skorBelirleTxtOut.isHidden = true
            
            print("2. oyuncu seçilmişti. Kontroller ayarlandı.")
        }

    }
    
    @IBAction func oyunuBitirBtnAct(_ sender: UIButton) {

        print("Bitir butonuna basıldı. Açılış kontrolleri ayarlanıyor.")
        
        // Açılış kontrollerini göster
        oyunBaşlaBtnOut.isHidden = false
        oyunMesajLblOut.isHidden = false
        skorBelirleTxtOut.isHidden = false
        
        // İlk değerleri yaz
        skorBelirleTxtOut.text = "\(hedefSkor)"
        oyunMesajLblOut.text = "Merhaba, Oyuna başlamak için bir bitiş skoru belirleyin ve 'Oyuna Başla' düğmesine basınız!"
        
        // Birinci oyuncu kontrollerini gizle
        oyuncuBirSkorLblOut.isHidden = true
        oyuncuBirMesajLblOut.isHidden = true
        oyuncuBirÇevirBtnOut.isHidden = true
        oyuncuBirBitirBtnOut.isHidden = true
        
        // ikinci oyuncu kontrollerini gizle
        oyuncuİkiSkorLblOut.isHidden = true
        oyuncuİkiMesajLblOut.isHidden = true
        oyuncuİkiÇevirBtnOut.isHidden = true
        oyuncuİkiBitirBtnOut.isHidden = true
        
        // Zar resimlerini gizle
        zarBirImgOut.isHidden = true
        zarİkiImgOut.isHidden = true

        print("Bitir butonuna basılmıştı. Açılış kontrolleri ayarlandı.")
        
    }
    
    @IBAction func oyuncuİkiÇevirBtnAct(_ sender: UIButton) {
        
            print("2. oyuncu çevir butonuna basıldı.")
        
            zarBirImgOut.animationImages =
                [ UIImage(named: "6.png"),
                  UIImage(named: "2.png"),
                  UIImage(named: "1.png"),
                  UIImage(named: "4.png"),
                  UIImage(named: "3.png"),
                  UIImage(named: "5.png"),
                  ] as? [UIImage]
            zarBirImgOut.animationDuration = 0.1
            zarBirImgOut.animationRepeatCount = 1
            zarBirImgOut.startAnimating()
            
            zarİkiImgOut.animationImages =
                [ UIImage(named: "5.png"),
                  UIImage(named: "3.png"),
                  UIImage(named: "4.png"),
                  UIImage(named: "1.png"),
                  UIImage(named: "2.png"),
                  UIImage(named: "6.png"),
                  ] as? [UIImage]
            zarİkiImgOut.animationDuration = 0.1
            zarİkiImgOut.animationRepeatCount = 1
            zarİkiImgOut.startAnimating()

            // Rastgele sayıları seçtir ve hafızada tut
            let rastgeleSayı1 = zarDeğer.randomElement()!
            let rastgeleSayı2 = zarDeğer.randomElement()!
        
            // İkinci oyuncuda ise ve zarlar eşit ise
            if sıraKimde == 2 && rastgeleSayı1 == rastgeleSayı2 {
            
                // Zarları göster ve skoru ekle
                zarBirImgOut.image = UIImage(named: "\(rastgeleSayı1).png")
                zarİkiImgOut.image = UIImage(named: "\(rastgeleSayı2).png")
                oyuncuİkiSkorLblOut.text = "\(Int(oyuncuİkiSkorLblOut.text!)! + 30 + rastgeleSayı1 + rastgeleSayı2)"
                oyuncuİkiSkor = Int(oyuncuİkiSkorLblOut.text!)!
                print("2. oyuncu için Sonuçlar : \(rastgeleSayı1) : \(rastgeleSayı2). Çift geldi. Toplam : \(rastgeleSayı1) + \(rastgeleSayı2) + 30  = \(30 + rastgeleSayı1 + rastgeleSayı2) puan aldı. Skor : \(oyuncuİkiSkor)")
                
                // oyun bitiş kontrolü yap
                    if oyuncuİkiSkor >= Int(hedefSkor)! {
                    // Oyun bitti ise kontrolleri gizle
                    oyuncuBirÇevirBtnOut.isHidden = true
                    oyuncuİkiÇevirBtnOut.isHidden = true
                    
                    // Oyun bitti mesajlarını göster
                    oyuncuBirMesajLblOut.isHidden = false
                    oyuncuİkiMesajLblOut.isHidden = false
                    
                    // Bitiş mesajlarını göster
                    oyuncuBirMesajLblOut.text = "Karşı kazandı!"
                    oyuncuBirMesajLblOut.textColor = UIColor.red
                    oyuncuİkiMesajLblOut.text = "Sen kazandı!"
                    oyuncuİkiMesajLblOut.textColor = UIColor.green
                    print("2. oyuncu kazandı. Skorlar : 1. oyuncu : \(oyuncuBirSkor) - 2. oyuncu : \(oyuncuİkiSkor)")
                        
                    // Sıra kimde ilk değere ayarla
                    sıraKimde = 0
                   
                    } else {
                    // Bitmediyse ikinci oyuncuya geçir
                    sıraKimde = 2
                    }
                // İkinci oyuncuda ise ve zarlar eşit değilse
            } else if sıraKimde == 2 && rastgeleSayı1 != rastgeleSayı2 {
                
                // Sıra ikinci oyuncuda ise zarleri göster ve skoru ekle
                zarBirImgOut.image = UIImage(named: "\(rastgeleSayı1).png")
                zarİkiImgOut.image = UIImage(named: "\(rastgeleSayı2).png")
                oyuncuİkiSkorLblOut.text = "\(Int(oyuncuİkiSkorLblOut.text!)! + rastgeleSayı1 + rastgeleSayı2)"
                oyuncuİkiSkor = Int(oyuncuİkiSkorLblOut.text!)!
                print("2. oyuncu için Sonuçlar : \(rastgeleSayı1) : \(rastgeleSayı2). Tek geldi. Toplam : \(rastgeleSayı1) + \(rastgeleSayı2)  = \(rastgeleSayı1 + rastgeleSayı2) puan aldı. Skor : \(oyuncuİkiSkor)")
                
                // oyun bitiş kontrolü yap
                    if oyuncuİkiSkor >= Int(hedefSkor)! {
                    
                    // Bittiyse birinci ve ikinci oyuncu çevir butonlarını gizle
                    oyuncuBirÇevirBtnOut.isHidden = true
                    oyuncuİkiÇevirBtnOut.isHidden = true
                    
                    // Bittiyse birinci ve ikinci oyuncu mesajlarını göster
                    oyuncuBirMesajLblOut.isHidden = false
                    oyuncuİkiMesajLblOut.isHidden = false
                    
                    // Bitiş mesajını ver
                    oyuncuBirMesajLblOut.text = "Karşı kazandı!"
                    oyuncuBirMesajLblOut.textColor = UIColor.red
                    oyuncuİkiMesajLblOut.text = "Sen kazandı!"
                    oyuncuİkiMesajLblOut.textColor = UIColor.green
                    print("2. oyuncu kazandı. Skorlar : 1. oyuncu : \(oyuncuBirSkor) - 2. oyuncu : \(oyuncuİkiSkor)")
                        
                    // Sıra kimde ilk değere ayarla
                    sıraKimde = 0
                    
                    } else {
                    // Bitmediyse birinci oyuncuya geçir
                    sıraKimde = 1
                    }
                
            }
            
            if sıraKimde == 1 {
                // Birinci oyuncu kontrollerini göster
                oyuncuBirSkorLblOut.isHidden = false
                oyuncuBirMesajLblOut.isHidden = true
                oyuncuBirÇevirBtnOut.isHidden = false
                oyuncuBirBitirBtnOut.isHidden = false
                
                // ikinci oyuncu kontrollerini gizle
                oyuncuİkiSkorLblOut.isHidden = false
                oyuncuİkiMesajLblOut.isHidden = true
                oyuncuİkiÇevirBtnOut.isHidden = true
                oyuncuİkiBitirBtnOut.isHidden = true
                
                // Zar resimlerini göster
                zarBirImgOut.isHidden = false
                zarİkiImgOut.isHidden = false
                
                // Açılış kontrollerini göster
                oyunBaşlaBtnOut.isHidden = true
                oyunMesajLblOut.isHidden = true
                skorBelirleTxtOut.isHidden = true
            } else if sıraKimde == 2 {
                // Birinci oyuncu kontrollerini gizle
                oyuncuBirSkorLblOut.isHidden = false
                oyuncuBirMesajLblOut.isHidden = true
                oyuncuBirÇevirBtnOut.isHidden = true
                oyuncuBirBitirBtnOut.isHidden = true
                
                // ikinci oyuncu kontrollerini göster
                oyuncuİkiSkorLblOut.isHidden = false
                oyuncuİkiMesajLblOut.isHidden = true
                oyuncuİkiÇevirBtnOut.isHidden = false
                oyuncuİkiBitirBtnOut.isHidden = false
                
                // Zar resimlerini göster
                zarBirImgOut.isHidden = false
                zarİkiImgOut.isHidden = false
                
                // Açılış kontrollerini gizle
                oyunBaşlaBtnOut.isHidden = true
                oyunMesajLblOut.isHidden = true
                skorBelirleTxtOut.isHidden = true
            }

    }
    
    
    @IBAction func oyuncuBirÇevirBtnAct(_ sender: UIButton) {
        
        print("1. oyuncu çevir butonuna basıldı.")
        
        zarBirImgOut.animationImages =
            [ UIImage(named: "6.png"),
              UIImage(named: "2.png"),
              UIImage(named: "1.png"),
              UIImage(named: "4.png"),
              UIImage(named: "3.png"),
              UIImage(named: "5.png"),
              ] as? [UIImage]
        zarBirImgOut.animationDuration = 0.1
        zarBirImgOut.animationRepeatCount = 1
        zarBirImgOut.startAnimating()
        
        zarİkiImgOut.animationImages =
            [ UIImage(named: "5.png"),
              UIImage(named: "3.png"),
              UIImage(named: "4.png"),
              UIImage(named: "1.png"),
              UIImage(named: "2.png"),
              UIImage(named: "6.png"),
              ] as? [UIImage]
        zarİkiImgOut.animationDuration = 0.1
        zarİkiImgOut.animationRepeatCount = 1
        zarİkiImgOut.startAnimating()
        
        // Rastgele sayıları seçtir ve hafızada tut
        let rastgeleSayı1 = zarDeğer.randomElement()!
        let rastgeleSayı2 = zarDeğer.randomElement()!
        
        //print("1. oyuncu için Sonuçlar : \(rastgeleSayı1) : \(rastgeleSayı2)")
        
        // Birinci oyuncuda ise ve zarlar eşit ise
        if sıraKimde == 1 && rastgeleSayı1 == rastgeleSayı2 {
            
            // Zarları göster ve skoru ekle
            zarBirImgOut.image = UIImage(named: "\(rastgeleSayı1).png")
            zarİkiImgOut.image = UIImage(named: "\(rastgeleSayı2).png")
            oyuncuBirSkorLblOut.text = "\(Int(oyuncuBirSkorLblOut.text!)! + 30 + rastgeleSayı1 + rastgeleSayı2)"
            oyuncuBirSkor = Int(oyuncuBirSkorLblOut.text!)!
            print("1. oyuncu için Sonuçlar : \(rastgeleSayı1) : \(rastgeleSayı2). Çift geldi. Toplam : \(rastgeleSayı1) + \(rastgeleSayı2) + 30  = \(30 + rastgeleSayı1 + rastgeleSayı2) puan aldı. Skor : \(oyuncuBirSkor)")
            
            // oyun bitiş kontrolü yap
            if oyuncuBirSkor >= Int(hedefSkor)! {
                // Bittiyse birinci ve ikinci oyuncu çevir butonunu gizle
                oyuncuBirÇevirBtnOut.isHidden = true
                oyuncuİkiÇevirBtnOut.isHidden = true

                // Bittiyse birinci ve ikinci oyuncu mesajlarını göster
                oyuncuBirMesajLblOut.isHidden = false
                oyuncuİkiMesajLblOut.isHidden = false
                
                // Bitiş mesajını ver
                oyuncuBirMesajLblOut.text = "Sen kazandı!"
                oyuncuBirMesajLblOut.textColor = UIColor.green
                oyuncuİkiMesajLblOut.text = "Karşı kazandı!"
                oyuncuİkiMesajLblOut.textColor = UIColor.red
                print("1. oyuncu kazandı. Skorlar : 1. oyuncu : \(oyuncuBirSkor) - 2. oyuncu : \(oyuncuİkiSkor)")
                
                // Sıra kimde ilk değere ayarla
                sıraKimde = 0
            } else {
            // Bitmediyse oyunu birinci oyuncuya geçir
               sıraKimde = 1
            }
            
        } else if sıraKimde == 1 && rastgeleSayı1 != rastgeleSayı2 {
            
            // Sıra birinci oyuncuda ise zarları göster ve skoru ekle
            zarBirImgOut.image = UIImage(named: "\(rastgeleSayı1).png")
            zarİkiImgOut.image = UIImage(named: "\(rastgeleSayı2).png")
            oyuncuBirSkorLblOut.text = "\(Int(oyuncuBirSkorLblOut.text!)! + rastgeleSayı1 + rastgeleSayı2)"
            oyuncuBirSkor = Int(oyuncuBirSkorLblOut.text!)!
            print("1. oyuncu için Sonuçlar : \(rastgeleSayı1) : \(rastgeleSayı2). Tek geldi. Toplam : \(rastgeleSayı1) + \(rastgeleSayı2)  = \( rastgeleSayı1 + rastgeleSayı2) puan aldı. Skor : \(oyuncuBirSkor)")
            
            // oyun bitiş kontrolü yap
            if oyuncuBirSkor >= Int(hedefSkor)! {
                // Bittiyse birinci ve ikinci oyuncu çevir butonlarını gizle
                oyuncuBirÇevirBtnOut.isHidden = true
                oyuncuİkiÇevirBtnOut.isHidden = true
                
                // Bittiyse birinci ve ikinci oyuncu mesajlarını göster
                oyuncuBirMesajLblOut.isHidden = false
                oyuncuİkiMesajLblOut.isHidden = false
                
                // Bitiş mesajını ver
                oyuncuBirMesajLblOut.text = "Sen kazandı!"
                oyuncuBirMesajLblOut.textColor = UIColor.green
                oyuncuİkiMesajLblOut.text = "Karşı kazandı!"
                oyuncuİkiMesajLblOut.textColor = UIColor.red
                print("1. oyuncu kazandı. Skorlar : 1. oyuncu : \(oyuncuBirSkor) - 2. oyuncu : \(oyuncuİkiSkor)")
                
                // Sıra kimde ilk değere ayarla
                sıraKimde = 0
            } else {
                // Bitmediyse oyunu ikinci oyuncuya geçir
                sıraKimde = 2
            }
            
        }

        // Sıra birinci oyuncıda ise
        if sıraKimde == 1 {
            // Birinci oyuncu kontrollerini göster
            oyuncuBirSkorLblOut.isHidden = false
            oyuncuBirMesajLblOut.isHidden = true
            oyuncuBirÇevirBtnOut.isHidden = false
            oyuncuBirBitirBtnOut.isHidden = false
            
            // ikinci oyuncu kontrollerini gizle
            oyuncuİkiSkorLblOut.isHidden = false
            oyuncuİkiMesajLblOut.isHidden = true
            oyuncuİkiÇevirBtnOut.isHidden = true
            oyuncuİkiBitirBtnOut.isHidden = true
            
            // Zar resimlerini gizle
            zarBirImgOut.isHidden = false
            zarİkiImgOut.isHidden = false
            
            // Açılış kontrollerini gizle
            oyunBaşlaBtnOut.isHidden = true
            oyunMesajLblOut.isHidden = true
            skorBelirleTxtOut.isHidden = true
        } else if sıraKimde == 2 {
            // Birinci oyuncu kontrollerini gizle
            oyuncuBirSkorLblOut.isHidden = false
            oyuncuBirMesajLblOut.isHidden = true
            oyuncuBirÇevirBtnOut.isHidden = true
            oyuncuBirBitirBtnOut.isHidden = true
            
            // ikinci oyuncu kontrollerini göster
            oyuncuİkiSkorLblOut.isHidden = false
            oyuncuİkiMesajLblOut.isHidden = true
            oyuncuİkiÇevirBtnOut.isHidden = false
            oyuncuİkiBitirBtnOut.isHidden = false
            
            // Zar resimlerini göster
            zarBirImgOut.isHidden = false
            zarİkiImgOut.isHidden = false
            
            // Açılış kontrollerini göster
            oyunBaşlaBtnOut.isHidden = true
            oyunMesajLblOut.isHidden = true
            skorBelirleTxtOut.isHidden = true
        }
        
    }
    
    @IBAction func textTıklandıAct(_ sender: UITextField) {
       // Klavyeyi göster
        skorBelirleTxtOut.resignFirstResponder()
        print("textField kontrolü kazandı. Klavye gösterildi.")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // view kontrolü tıklanırsa klavyeyi gizle
        self.view.endEditing(true)
        print("textField kontrolü kaybetti. Klavye gizlendi.")
    }
    
}

