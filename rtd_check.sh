#!/bin/bash

# Renk tanımlamaları
YESIL='\033[0;32m'
KIRMIZI='\033[0;31m'
SARI='\033[0;33m'
MAVI='\033[0;34m'
KAPAT='\033[0m'

echo -e "${MAVI}🔍 Read the Docs & Sphinx Proje Kontrolü Başlatılıyor...${KAPAT}"
echo "--------------------------------------------------------"

HATA_VAR=0

# 1. .readthedocs.yaml Kök Dizin Kontrolü
if [ -f ".readthedocs.yaml" ]; then
    echo -e "[${YESIL}OK${KAPAT}] .readthedocs.yaml dosyası kök dizinde mevcut."
    
    # İçerik ve boşluk kontrolü (Gizli boşluk hatasını yakalar)
    if grep -q "python: \" 3." .readthedocs.yaml; then
        echo -e "[${KIRMIZI}HATA${KAPAT}] .readthedocs.yaml içinde Python sürümünün başında boşluk var! (' 3.10' gibi)"
        HATA_VAR=1
    fi
    
    # Konfigürasyon yolu kontrolü
    if ! grep -q "configuration: source/conf.py" .readthedocs.yaml; then
        echo -e "[${SARI}UYARI${KAPAT}] .readthedocs.yaml içindeki 'configuration' yolu 'source/conf.py' olmayabilir. Kontrol edin."
    fi
else
    echo -e "[${KIRMIZI}HATA${KAPAT}] .readthedocs.yaml dosyası kök dizinde BULUNAMADI!"
    HATA_VAR=1
fi

# 2. Sphinx source/conf.py Kontrolü
if [ -f "source/conf.py" ]; then
    echo -e "[${YESIL}OK${KAPAT}] Sphinx ayar dosyası (source/conf.py) mevcut."
else
    echo -e "[${KIRMIZI}HATA${KAPAT}] source/conf.py bulunamadı! Sphinx projesi eksik kurulmuş."
    HATA_VAR=1
fi

# 3. index.rst Menü Ağacı (toctree) Kontrolü
if [ -f "source/index.rst" ]; then
    echo -e "[${YESIL}OK${KAPAT}] Ana sayfa (source/index.rst) mevcut."
    
    # index.rst içindeki dosyaların sistemde gerçekten var olup olmadığını kontrol et
    echo -e "${MAVI}📂 Menüdeki (toctree) dosyalar taranıyor...${KAPAT}"
    
    # index.rst içindeki toctree altındaki olası dosya isimlerini ayıkla (Basit bir kontrol)
    grep -E '^[[:space:]]{3,}[a-zA-Z0-9_-]+$' source/index.rst | sed 's/^[[:space:]]*//' | while read -r dosya_adi; do
        if [ ! -f "source/${dosya_adi}.rst" ]; then
            echo -e "  [${KIRMIZI}EKSİK${KAPAT}] index.rst içinde çağrılan '${dosya_adi}.rst' dosyası source/ altında yok!"
            HATA_VAR=1
        else
            echo -e "  [${YESIL}VAR${KAPAT}] ${dosya_adi}.rst"
        fi
    done
else
    echo -e "[${KIRMIZI}HATA${KAPAT}] source/index.rst bulunamadı!"
    HATA_VAR=1
fi

# 4. Yerel Derleme (make html) Simülasyonu
echo "--------------------------------------------------------"
echo -e "${MAVI}🛠️ Yerel Sphinx derlemesi test ediliyor (make clean && make html)...${KAPAT}"

# Geçici bir log dosyasına çıktı alalım
make clean > /dev/null 2>&1
make html > sphinx_build.log 2>&1

if [ $? -eq 0 ]; then
    # Derleme başarılı ama uyarı var mı?
    if grep -q "WARNING:" sphinx_build.log; then
        echo -e "[${SARI}UYARI${KAPAT}] Derleme başarılı ancak Sphinx uyarılar (WARNING) verdi!"
        echo -e "${SARI}Kritik Uyarı Satırları:${KAPAT}"
        grep "WARNING:" sphinx_build.log
    else
        echo -e "[${YESIL}MÜKEMMEL${KAPAT}] Yerel derleme SIFIR hata ve SIFIR uyarı ile tamamlandı."
    fi
else
    echo -e "[${KIRMIZI}HATA${KAPAT}] Yerel derleme (make html) BAŞARISIZ oldu!"
    echo -e "${KIRMIZI}Hata Detayları:${KAPAT}"
    cat sphinx_build.log
    HATA_VAR=1
fi

# Log dosyasını temizle
rm -f sphinx_build.log

# 5. Genel Sonuç ve Karar
echo "--------------------------------------------------------"
if [ $HATA_VAR -eq 0 ]; then
    echo -e "${YESIL}🚀 PROJE HAZIR! Tüm kontroller başarıyla tamamlandı. Güvenle GitHub'a yükleyebilirsiniz.${KAPAT}"
    exit 0
else
    echo -e "${KIRMIZI}❌ PROJEDE HATALAR VAR! Lütfen yukarıdaki kırmızı hataları düzeltmeden GitHub'a push yapmayın.${KAPAT}"
    exit 1
fi
