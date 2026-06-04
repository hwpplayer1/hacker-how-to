#!/bin/bash

# 1. Pandoc kontrolü
if ! command -v pandoc &> /dev/null; then
    echo "❌ Pandoc bulunamadı! Lütfen önce sisteminize yükleyin."
    echo "Yüklemek için terminale şu komutu yazabilirsiniz:"
    echo "sudo apt-get update && sudo apt-get install pandoc"
    exit 1
fi

# 2. Çevrilecek Markdown dosyalarını say
md_sayisi=$(ls *.md 2>/dev/null | wc -l)

if [ "$md_sayisi" -eq 0 ]; then
    echo "⚠️ Ana dizinde çevrilecek .md uzantılı dosya bulunamadı!"
    exit 1
fi

echo "🔄 $md_sayisi adet Markdown dosyası reStructuredText (.rst) formatına çevriliyor..."
echo "--------------------------------------------------------"

# 3. Dönüştürme döngüsü
for dosya in *.md; do
    # Dosya adını uzantısı olmadan al (Örn: README.md -> README)
    dosya_adi="${dosya%.md}"
    
    echo "⏳ Çevriliyor: $dosya -> ${dosya_adi}.rst"
    
    # Pandoc ile dönüşüm yap
    pandoc "$dosya" -f markdown -t rst -o "${dosya_adi}.rst"
done

echo "--------------------------------------------------------"
echo "✅ Tüm dosyalar başarıyla çevrildi!"
