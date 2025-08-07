#!/bin/bash

# E-posta adresini kullanıcıdan al
read -p "E-posta adresinizi girin: " email

# Parolayı kullanıcıdan al
read -s -p "Parolanızı girin (boş bırakırsanız otomatik rastgele güçlü bir parola oluşturulur): " password
echo ""

# Parola boş ise, otomatik olarak oluştur
if [ -z "$password" ]; then
  password=$(pwgen -s -y 36 1)
  echo "Rastgele güçlü bir parola oluşturuldu."
  echo ""
else
  echo "Parolanız alındı!"
  echo ""
fi

# Anahtar dosyalarını oluştur
ssh-keygen -t ed25519 -a 100 -N "$password" -C "$email" -f ~/.ssh/"$email"
echo ""

if [ $? -eq 0 ]; then
  echo "SSH anahtar çifti başarıyla oluşturuldu."
  # Güvenlik nedeniyle parolayı dosyaya kaydetmek yerine, bir parola yöneticisi kullanın.
  # Parola yöneticisi kullanmıyorsanız, parolayı güvenli bir yere kopyalayın.
  # echo "SSH anahtar parolanız: $password" > ~/password.txt
else
  echo "SSH anahtar çifti oluşturma hatası."
fi

# Özel anahtarların saklandığı klasör ve özel anahtar dosyasının izinlerini ayarlayın
chmod 700 ~/.ssh
chmod 600 ~/.ssh/"$email"
echo ""

echo "Genel anahtarınızı paylaşabilirsiniz. Genellikle, SSH erişimi sağlamak istediğiniz sunuculara bu anahtarı kopyalarsınız."
echo "Genel anahtar: ~/.ssh/$email.pub"
echo ""
# Genel anahtarın içeriğini ekrana yazdır
echo "SSH Genel Anahtar İçeriği:"
cat ~/.ssh/"$email".pub
echo ""
echo "Özel anahtarınızı kesinlikle kimseyle paylaşmayın ve güvenli bir yerde saklayın."
echo "Özel anahtar: ~/.ssh/$email"
echo ""
echo "Güvenlik nedeniyle parolayı dosyaya kaydetmek yerine, bir parola yöneticisi kullanın."
echo "Otomatik oluşturulan parola: $password"
