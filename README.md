# appserver-box 

A vagrant box (created by [Puphpet.com](https://puphpet.com/)) to get up a running fast for developing in an [appserver environment](http://appserver.io).

NOTE: This setup is for local development only! Do not use this box in a production environment!

###What Do You Get?


appserver-box installs the following software automatically on the guest VM.

- appserver 1.1.0
- PHP5.6 (PHP-FPM and CLI)
- Debian Wheezy 64bit
- MariaDB 10.1
- PHPMyAdmin
- Composer (globally)
- PHPUnit (globally)
- Git

and the standard packages for Debian.

###Installation Instructions

**Prerequisites**

You must have a virtualization system like [VirtualBox](https://www.virtualbox.org/) and also have [Vagrant](https://www.vagrantup.com/) installed on your host system.

**Steps**

Clone or download this repo as a ZIP file on your host machine. If you used the zip, unpack the files in a directory of your choice. 

There is currently no shared files defined.

Once downloaded or cloned, go into the console on the host machine (or with Git Bash) and `cd` into the directory, where the `Vagrantfile` is located. Then simply enter 

`vagrant up`

Note: It will take approximately 10-15 minutes for the VM to install and initialize. 

Once you get the Puphpet "finished" screen in your console, you can log into the VM via SSH. Before that though, you'll need to set up your SSH client to read the private key, which was set up for you automatically. You can find the keys under 

`/vagrant/files/dot/ssh`

The user you'll be using is "root". 

The server can be found under the IP address `192.168.33.10`. 
```
http://192.168.33.10
``` 
**Final Steps to use PHPMyAdmin**

The PHPMyAdmin setup can now be found under 

```
http://192.168.33.10/phpmyadmin/setup
``` 

The user and password for PHPMyAdmin is "root".

NOTE: This setup is for local development only! Do not use this box in a production environment!

**Working with the Graph Database**

If you want to use the web clients for OrientDB, you can do that too. 

**OrientDB:** http://192.168.33.10:2480

Also under '/home/vagrant/` you'll find the install directories for the database. ODB's console is also available there.

###Other Considerations and Options

**Other providers**(currently untested!)

VirtualBox is currently the standard virtualization system for the Guest VM. If you have a different System `appserver-box` supports both Parallels and VMWare Fusion. To use these, enter the `--provider`flag, when you use `vagrant up`, like this.

`vagrant up --provider parallels`

**.sh Script Files and Other File Locations**

All the initialization and startup files are located under `/puphet/files`. The initialization files are under `/exec-once`and the startup files are under `/startup-once`. If you'd like to add to these files, you may, but at your own risk.

**Custom Configuration of the Vagrant Box**

You can also customize the box too, if you'd like. Under `/puphpet` copy the `config.yaml`file and rename it to `config-custom.yaml` and save it in the same place. Make any changes you'd like in that file. There are also more possibilities to customize the `appserver-box` through the tools made available by Puphpet. To read more about that visit the [Puphpet website](https://puphpet.com/) (click on "Help!").

**Host File Changes**

If you want, you can also change your host file on the host machine, so you can access the `appserver-box`via a normal URL like `http://www.appserver-box.dev`. Search for your `hosts`file and save the following.

`192.168.33.10 appserver-box.dev www.appserver-box.dev`



Happy programming!
