#!/bin/bash

# docs klasörü yoksa oluştur
if [ ! -d "docs" ]; then
    echo "📁 'docs' klasörü bulunamadı, oluşturuluyor..."
    mkdir docs
fi

# Ana dizindeki .rst dosyalarını say
rst_sayisi=$(ls *.rst 2>/dev/null | wc -l)

if [ "$rst_sayisi" -gt 0 ]; then
    echo "🚚 $rst_sayisi adet .rst dosyası 'docs/' klasörüne taşınıyor..."
    mv *.rst docs/
else
    echo "⚠️ Ana dizinde taşınacak .rst dosyası bulunamadı!"
fi

# Varsa images klasörünü de docs içine taşı/kopyala
if [ -d "images" ]; then
    echo "🖼️ 'images' klasörü 'docs/' altına taşınıyor..."
    mv images docs/
fi

echo "✅ İşlem tamamlandı! Dosyalarınız 'docs/' klasöründe."
