## <center>RC1测试网——Linux系统操作指南

### 1.网址
* go [https://golang.org/dl](https://golang.org/dl "https://golang.org/dl")
* faucet 水龙头 [http://faucet1.testnet.hybrid.network/](http://faucet1.testnet.hybrid.network/ "http://faucet1.testnet.hybrid.network/") 转账使用
* explorer 区块浏览器 [http://explorer1.testnet.hybrid.network](http://explorer1.testnet.hybrid.network "http://explorer1.testnet.hybrid.network")

### 2.安装go

link：https://golang.org/dl/

### 3.命令行

	apt-get update && apt-get install -y wget git curl
    wget https://dl.google.com/go/go1.10.linux-amd64.tar.gz
	tar -C /usr/local -xzf go1.10.linux-amd64.tar.gz
	echo "export PATH=$PATH:/usr/local/go/bin">>/etc/profile
	source /etc/profile

	mkdir $HOME/go
	mkdir $HOME/go/src
	mkdir $HOME/go/bin
	mkdir $HOME/go/src/github.com
	mkdir $HOME/go/src/github.com/hybridnetwork

	echo "export GOPATH=$HOME/go">>/etc/profile
	echo "export PATH=$PATH:$HOME/go/bin">>/etc/profile
	source /etc/profile

	curl https://glide.sh/get | sh

	cd $HOME/go/src/github.com/hybridnetwork
	git clone https://github.com/hybridnetwork/hxd
	git clone https://github.com/hybridnetwork/hxwallet

	cd hxd
	glide install
	go install $(glide nv)

	cd ../hxwallet
	glide install
	go install $(glide nv)

	hxd -u user -P pass --testnet
	hxwallet -u user -P pass --create
	hxwallet -u user -P pass --testnet
