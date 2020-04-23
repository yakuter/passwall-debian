# passwall-debian
# Building Debian Package

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
