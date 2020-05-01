# PassWall Debian Packager

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/pass-wall/passwall-debian/CI) ![Version](https://img.shields.io/github/v/release/pass-wall/passwall-debian) ![GitHub All Releases](https://img.shields.io/github/downloads/pass-wall/passwall-debian/total)

This repo provides a Debian package of PassWall which includes the up to date passwall-web and passwall-server softwares. You can find all released deb packages at the releases page.

# Installation
Download the latest release:

https://github.com/pass-wall/passwall-debian/releases/latest/download/passwall-x64.deb

Install the downloaded deb package

```
sudo apt install ./passwall-x64.deb
```

# Building Debian Package
> This section is for advanced users. If you want to build your own package you can follow these instructions. 

Install the dependencies 

```
sudo apt install git npm
```

Clone the repository

```
git clone https://github.com/brnskn/passwall-debian.git

cd passwall-debian
```

Install GOLANG

```
wget https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.14.2.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
```

Run the shell script

```
chmod +x make_deb.sh
./make_deb.sh <version_name>
```

Install the deb package

```
sudo apt install /tmp/passwall-build/passwall-debian.deb
```
