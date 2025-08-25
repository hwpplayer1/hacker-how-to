#!/bin/bash

# Federatif Signed Commit Denetleyici (Etkileşimli versiyon)
# Gereksinimler: gpg, git

echo "🔐 Lütfen GPG key ID'nizi girin (örnek: D200B456637BC4F3):"
read -r KEYID

if [ -z "$KEYID" ]; then
  echo "❌ GPG key ID girilmedi. Çıkılıyor."
  exit 1
fi

echo "🔍 GPG Key ID: $KEYID"

# GPG key'den email'leri çek
echo "📧 GPG Key'e bağlı epostalar:"
gpg --list-keys "$KEYID" | grep -E 'uid' | sed -E 's/.*<([^>]+)>.*/\1/' | tee /tmp/gpg_emails.txt

# Git config'deki email ve signing key
GIT_EMAIL=$(git config user.email)
GIT_SIGNKEY=$(git config user.signingkey)
GIT_REMOTE=$(git remote get-url origin)

echo "📝 Git config email: $GIT_EMAIL"
echo "🔐 Git signing key: $GIT_SIGNKEY"
echo "🌐 Git remote URL: $GIT_REMOTE"

# SSH bağlantısı mı?
if [[ "$GIT_REMOTE" == git@github.com:* ]]; then
  echo "✅ SSH bağlantısı kullanılıyor."
else
  echo "⚠️ Uyarı: GitHub bağlantısı SSH değil. HTTPS kullanılıyorsa GPG doğrulama etkilenmez ama SSH tercih edilir."
fi

# Son commit signed mı?
echo "🧾 Son commit imza durumu:"
git log --show-signature -1

# Eşleşme kontrolü
echo "🔗 GPG ↔ Git eşleşme kontrolü:"
MATCH=false
while read -r gpg_email; do
  if [[ "$gpg_email" == "$GIT_EMAIL" ]]; then
    echo "✅ GPG email Git config ile eşleşiyor: $gpg_email"
    MATCH=true
  fi
done < /tmp/gpg_emails.txt

if [ "$MATCH" = false ]; then
  echo "❌ GPG email Git config ile eşleşmiyor. Commit'ler GitHub'da 'Unverified' olabilir."
fi

echo "🎯 Denetim tamamlandı."
