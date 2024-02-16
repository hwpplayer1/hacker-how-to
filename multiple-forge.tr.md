# Birden fazla forge(kod barındırma ortamına) içerik göndermek

Öncelikle ilgili forge web kullanıcı arayüzlerinde uzaktaki adres arayüzünden depolar oluşturuyoruz.

Bunun için aşağıdaki gibi adreslere erişiyoruz : 

* [GitHub](https://github.com/hwpplayer1/hacker-how-to)
* [GitLab](https://gitlab.com/masscollabs/masscollaborationlabs/hacker-how-to)
* [sr.ht](https://git.sr.ht/~mertgor/hacker-how-to)
* [vern.cc](https://git.vern.cc/hwpplayer1/hacker-how-to)
* [Disroot](https://git.disroot.org/hwpplayer1/hacker-how-to)
* [Codeberg](https://codeberg.org/hwpplayer1/hacker-how-to)

ve yerel kod ortamımız ( forge ) benim için bu forgejo'dur.

Biz SSH adreslerini ekliyoruz ancak siz https adreslerini ekleyebilirsiniz.

Adım adım anlatımı aşağıdaki gibidir : 

```git clone git@github.com:hwpplayer1/hacker-how-to.git```

Sonra ```cd hacker-how-to```

Ve bundan sonra ```origin``` adres ismini ```github``` ile değiştirin ve ```git remote add all git@github.com:hwpplayer1/hacker-how-to.git``` adresini all olarak ekleyin.

Bu, GitHub'ın all olarak ilk ve lider olarak tüm depoları kapsayacak şekilde bizim içerik göndermemizi sağlaycaktır.

Bundan sonra  ```git remote add gitlab git@gitlab.com:masscollabs/masscollaborationlabs/hacker-how-to.git``` GitLab adresini ekleyelim.

sr.ht için ```git remote add sr.ht git@git.sr.ht:~mertgor/hacker-how-to```

vern.cc için ```git remote add vern.cc ssh://git@vern.cc:1813/hwpplayer1/hacker-how-to.git```

disroot için ```git remote add disroot git@git.disroot.org:hwpplayer1/hacker-how-to.git```

ve Codeberg için ```git remote add codeberg git@codeberg.org:hwpplayer1/hacker-how-to.git```4

Bu aşamadan sonra her adres için bu komutu çalıştıracağız ```git remote set-url --add --push all``` 

Bunlar :


```git remote set-url --add --push all git@github.com:hwpplayer1/hacker-how-to.git```

```git remote set-url --add --push all git@gitlab.com:masscollabs/masscollaborationlabs/hacker-how-to.git```

```git remote set-url --add --push all git@git.sr.ht:~mertgor/hacker-how-to```

```git remote set-url --add --push all ssh://git@vern.cc:1813/hwpplayer1/hacker-how-to.git```

```git remote set-url --add --push all git@git.disroot.org:hwpplayer1/hacker-how-to.git```

```git remote set-url --add --push all git@codeberg.org:hwpplayer1/hacker-how-to.git```

ve benim local forge(forgejo'm)'um için ```git remote set-url --add --push all git@127.0.0.1:hwpplayer1/hacker-how-to.git```

Sonra kodumuzu veya içeriğimizi göndermek için sırasıyla  ```git add .``` dosyalarımızı eklemek için,  ```git commit -S -m "Your Commit Message"``` dosyalarımızı işlemek için, ve ```git push -uv all``` dosyalarımızı ilgili uzak depolara(forge ortamlarına) göndermek için çalıştırılacaktır.

**mutlu hacklemeler!...**
