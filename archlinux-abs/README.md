Deploy Disposable Archlinux ABS Enviroment.

The User has a Custom ZSH and VIM Config.

To start the Instance

```
docker -ti setkeh/archlinux-abs /bin/bash
```

Then Change user to the docker user

```
su - docker
```

There is a Pre-created abs directory in /home/docker/abs
To begin a build from abs

```
cp -r /var/abs/<Repo>/<Package /home/docker/abs
```

Where Repo = Core, Multilib, Community, Extra
Where Package = Package name e.g gcc from core.

then follow build instructions on the Archwiki

[How to use ABS - Archlinux Wiki][1]

Its Also a good idea before changing to the docker user to run the abs command to update the abs repo though i will try to keep the image up to date with an autobuild.

Please Report any issues to [Archlinux-ABS Issue's - Github][2]


  [1]: https://wiki.archlinux.org/index.php/Arch_Build_System#How_to_use_ABS
  [2]: https://github.com/setkeh/Archlinux-Abs-Docker/issues