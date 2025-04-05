# Bir git tabanlı projede yazma iznine sahip olmak isteyen Hackerlar(Yazılımcılar) için Kılavuz

![Free Software](img/freesoftware1024x768.png)

Bu makale, içerik üretme ile ilgili her türlü forge'ye(yazılım depo platformuna) içerikleri göndermek için her türlü git odaklı iş akışına sahip bir yazılımcı olmanın yolunu anlatır.

# SSH Anahtarlarını Ayarlama

Lütfen aşağıdaki bağlantıları okuyunuz :


* https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
    
* https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

# GPG Anahtarını Yapılandırma

* https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key

* GPG Anahtarını oluşturduktan sonra lütfen şu komutu çalıştırın:

```
gpg --list-secret-keys --keyid-format=long
```

* Ardından bu komutu çalıştırın ancak ```3AA5C34371567BD2```'yi GPG Anahtar Kimliğinizle değiştirin:

```
gpg --output secret.key --export-secret-keys 3AA5C34371567BD2
```

* Ardından İptal Sertifikası için bu komutu çalıştırın ancak 3AA5C34371567BD2'yi GPG Anahtar Kimliğinizle değiştirin:

```
gpg --output revoke.asc --gen-revoke 3AA5C34371567BD2
```

* Daha sonra bu komutla genel anahtarınızı dışa aktarın ancak ```3AA5C34371567BD2```'yi GPG Anahtar Kimliğinizle değiştirin:

```
gpg --armor --export 3AA5C34371567BD2 > 3AA5C34371567BD2.asc
```

* [PGP Global Directory'de](https://keyserver.pgp.com/vkd/GetWelcomeScreen.event)  yayınlayın, anahtarı içe aktarın, güvenin ve Thunderbird E-posta İstemcisi veya başka bir istemciyle imzalayın

* Bundan sonra secret.key ve revoke.asc dosyalarınızı harici bir diske yedekleyin ve güvende tutun.

* Ardından genel anahtarınızı bir metin düzenleyiciyle açın ve tüm metni kopyalayın ve Genel Anahtarınızı burada anlatıldığı gibi GitHub'a ekleyin:  https://docs.github.com/en/authentication/managing-commit-signature-verification/adding-a-gpg-key-to-your-github-account

# Yazdığınız içerikleri GPG Anahtarınızla imzalamak için

Lütfen aşağıdaki bağlantıları okuyunuz :

* https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits

* https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key

# Kullanıcı E-postasını ve Kullanıcı Adını commit'ler için yapılandırma

* https://docs.github.com/en/get-started/getting-started-with-git/setting-your-username-in-git

* https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-personal-account-on-github/managing-email-preferences/setting-your-commit-email-address

# Sonuç

* SSH Key'i oluşturduk ve public SSH Key'imizi GitHub hesabımıza ekledik.

* Bu örnekte GPG Anahtarını oluşturduk, genel anahtarımızı bir sunucuya gönderdik ve ardından secret.key ve revoke.asc'mizi harici bir diske taşıdık. Daha sonra GPG genel anahtarımızı GitHub hesabına ekledik.

* Yazdığımız içeriği imzalamak için git hesabımızı yapılandırdık.

mutlu hacklemeler(başarılar ve başarıya ulaşmanız dileğiyle)

# Bu belgeleri nerede saklıyoruz ?

* https://source.masscollabs.xyz/masscollaborationlabs/hacker-how-to

* https://github.com/hwpplayer1/hacker-how-to

* https://gitlab.com/masscollabs/masscollaborationlabs/hacker-how-to

* https://git.sr.ht/~mertgor/hacker-how-to

* https://git.vern.cc/hwpplayer1/hacker-how-to

* https://git.disroot.org/hwpplayer1/hacker-how-to

* https://codeberg.org/hwpplayer1/hacker-how-to

* https://git.emin.software/hwpplayer1/hacker-how-to

# Lisans

[CC BY-SA 4.0 or any later](https://github.com/hwpplayer1/hacker-how-to/blob/master/by-sa.markdown)

