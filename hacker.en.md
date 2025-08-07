# A Guide for Hackers who want to become a committer

![Free Software](img/freesoftware1024x768.png)

This repository includes the path to become a committer with any kind of git oriented workflow to push commits to any kind of forge.

# Setting SSH Keys

Please read : 

* https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
* https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

# Configuring GPG Key

* https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key

* After generating GPG Key please run :

```
gpg --list-secret-keys --keyid-format=long
```

* Then run this command but replace ```3AA5C34371567BD2``` with your GPG Key ID:
```
gpg --output secret.key --export-secret-keys 3AA5C34371567BD2
```
* Then run this command for Revocation Certificate but replace ```3AA5C34371567BD2``` with your GPG Key ID:
```
gpg --output revoke.asc --gen-revoke 3AA5C34371567BD2
```
*  Then export your public key with this command but replace ```3AA5C34371567BD2``` with your GPG Key ID :
```
gpg --armor --export 3AA5C34371567BD2 > 3AA5C34371567BD2.asc
```
* publish to [PGP Global Directory](https://keyserver.pgp.com/vkd/GetWelcomeScreen.event) , import key , trust and sign with Thunderbird Email Client or any other client

* After this backup your secret.key and revoke.asc to an external disk and keep it safe.

* Then open your public key with a text editor and copy all text and add your Public Key to GitHub like told here : https://docs.github.com/en/authentication/managing-commit-signature-verification/adding-a-gpg-key-to-your-github-account

# For signing Commits with your GPG Key

Please read this : 

* https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits
* https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key

# Configuring User Email and User Name for commits

* https://docs.github.com/en/get-started/getting-started-with-git/setting-your-username-in-git

* https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-personal-account-on-github/managing-email-preferences/setting-your-commit-email-address

# Conclusion

* We have generated SSH Key and added our public SSH Key to our GitHub account.
* We have generated GPG Key, exported secret key, exported revocation certificate, published our public key to a server in this example PGP Global Directory and then we moved our secret.key and revoke.asc to an external disk. Then we added our GPG key to GitHub account.
* For signing commit we configured our git account.

**happy hacking!...**

# Where we store this documentation

* https://source.masscollabs.xyz/masscollaborationlabs/hacker-how-to

* https://github.com/hwpplayer1/hacker-how-to

* https://gitlab.com/masscollabs/masscollaborationlabs/hacker-how-to

* https://git.sr.ht/~mertgor/hacker-how-to

* https://git.vern.cc/hwpplayer1/hacker-how-to

* https://git.disroot.org/hwpplayer1/hacker-how-to

* https://codeberg.org/hwpplayer1/hacker-how-to

* https://git.emin.software/hwpplayer1/hacker-how-to

# License

[CC BY-SA 4.0 or any later](by-sa.markdown)

