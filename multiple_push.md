# Multiple Git repositories to push at once

First we create remote repositories on the related forge web user interfaces.

For this repository it is :

* [Masscollabs Services](https://source.masscollabs.xyz/masscollaborationlabs/hacker-how-to)

* [GitHub](https://github.com/hwpplayer1/hacker-how-to)

* [GitLab](https://gitlab.com/masscollabs/masscollaborationlabs/hacker-how-to)

* [sr.ht](https://git.sr.ht/~mertgor/hacker-how-to)

* [Disroot](https://git.disroot.org/hwpplayer1/hacker-how-to)

* [Codeberg](https://codeberg.org/hwpplayer1/hacker-how-to)

* [Emin.Software](https://git.emin.software/hwpplayer1/hacker-how-to)

We add SSH addresses but you may add the https addresses

Here it is step by step 

```git clone ssh://git@source.masscollabs.xyz/masscollaborationlabs/hacker-how-to.git```

Then ```cd hacker-howo-to```

After thıs change the ```origin``` with ```masscollabs``` and add ```git clone ssh://git@source.masscollabs.xyz/masscollaborationlabs/hacker-how-to.git```

This will make the Masscollabs Source Forge lead for all address

After this add GitHub ```git clone git@github.com:hwpplayer1/hacker-how-to.git```

After this add GitLab ```git remote add gitlab git@gitlab.com:masscollabs/masscollaborationlabs/hacker-how-to.git```

After this add sr.ht ```git remote add sr.ht git@git.sr.ht:~mertgor/hacker-how-to```

After this add disroot ```git remote add disroot git@git.disroot.org:hwpplayer1/hacker-how-to.git```

After this add codeberg ```git remote add codeberg git@codeberg.org:hwpplayer1/hacker-how-to.git```

and after this add emin.software ```git remote add emin.software ssh://git@git.emin.software:3022/hwpplayer1/hacker-how-to.git```

After this we will execute ```git remote set-url --add --push all``` command for each git ssh address

They are :

```git remote set-url --add --push all ssh://git@source.masscollabs.xyz/masscollaborationlabs/hacker-how-to.git```

```git remote set-url --add --push all git@github.com:hwpplayer1/hacker-how-to.git```

```git remote set-url --add --push all git@gitlab.com:masscollabs/masscollaborationlabs/hacker-how-to.git```

```git remote set-url --add --push all git@git.sr.ht:~mertgor/hacker-how-to```

```git remote set-url --add --push all git@git.disroot.org:hwpplayer1/hacker-how-to.git```

```git remote set-url --add --push all git@codeberg.org:hwpplayer1/hacker-how-to.git```

```git remote set-url --addd --push all ssh://git@git.emin.software:3022/hwpplayer1/hacker-how-to.git```

Then run ```git add .``` for your files ```git commit -S -m "Your Commit Message"``` and run ```git push -uv all``` to push your commits to remote.

Source : https://forum.pardus.org.tr/t/birden-fazla-git-reposuna-sahip-olmak/15381/3 

**happy hacking!...**
