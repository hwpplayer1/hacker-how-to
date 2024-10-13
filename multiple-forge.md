# Multiple Git repositories to push at once

First we create remote repositories on the related forge web user interfaces.

For this repository they are :

* [GitHub](https://github.com/hwpplayer1/hacker-how-to)
* [GitLab](https://gitlab.com/masscollabs/masscollaborationlabs/hacker-how-to)
* [sr.ht](https://git.sr.ht/~mertgor/hacker-how-to)
* [vern.cc](https://git.vern.cc/hwpplayer1/hacker-how-to)
* [Disroot](https://git.disroot.org/hwpplayer1/hacker-how-to)
* [Codeberg](https://codeberg.org/hwpplayer1/hacker-how-to)
* [Truva Linux](https://git.truvalinux.org.tr/hwpplayer1/hacker-how-to)


and your local forge (for me it is forgejo)

We add SSH addresses but you may add the https addresses

Here it is step by step 

```git clone git@github.com:hwpplayer1/hacker-how-to.git```

Then ```cd hacker-how-to```

After this change the ```origin``` with ```github``` and add ```git remote add all git@github.com:hwpplayer1/hacker-how-to.git```

This will make the GitHub all address to lead all repositories

After this add GitLab ```git remote add gitlab git@gitlab.com:masscollabs/masscollaborationlabs/hacker-how-to.git```

sr.ht ```git remote add sr.ht git@git.sr.ht:~mertgor/hacker-how-to```

vern.cc ```git remote add vern.cc ssh://git@vern.cc:1813/hwpplayer1/hacker-how-to.git```

disroot ```git remote add disroot git@git.disroot.org:hwpplayer1/hacker-how-to.git```

codeberg ```git remote add codeberg git@codeberg.org:hwpplayer1/hacker-how-to.git```

and Truva Linux ```https://git.truvalinux.org.tr/hwpplayer1/hacker-how-to.git```

After this we will execute ```git remote set-url --add --push all``` command for each git ssh address

They are :

```git remote set-url --add --push all git@github.com:hwpplayer1/hacker-how-to.git```

```git remote set-url --add --push all git@gitlab.com:masscollabs/masscollaborationlabs/hacker-how-to.git```

```git remote set-url --add --push all git@git.sr.ht:~mertgor/hacker-how-to```

```git remote set-url --add --push all ssh://git@vern.cc:1813/hwpplayer1/hacker-how-to.git```

```git remote set-url --add --push all git@git.disroot.org:hwpplayer1/hacker-how-to.git```

```git remote set-url --add --push all git@codeberg.org:hwpplayer1/hacker-how-to.git```

```git remote set-url --add --push all https://git.truvalinux.org.tr/hwpplayer1/hacker-how-to.git```

and for my local forge as forgejo it is ```git remote set-url --add --push all git@127.0.0.1:hwpplayer1/hacker-how-to.git```

Then run ```git add .``` for your files ```git commit -S -m "Your Commit Message"``` and run ```git push -uv all``` to push your commits to remote.

**happy hacking!...**
