## <center>RC1测试网——Linux系统操作指南

### 1.网址
* go下载 [https://golang.org/dl](https://golang.org/dl "https://golang.org/dl")
* faucet1 水龙头1 [http://faucet1.testnet.hybrid.network/](http://faucet1.testnet.hybrid.network/ "http://faucet1.testnet.hybrid.network/") 转账使用

* faucet1 水龙头2 [http://faucet2.testnet.hybrid.network](http://faucet2.testnet.hybrid.network "http://faucet2.testnet.hybrid.network") 转账使用
* 
* explorer 区块浏览器 [http://explorer1.testnet.hybrid.network](http://explorer1.testnet.hybrid.network "http://explorer1.testnet.hybrid.network")
* pool 矿池 [http://stakepool1.testnet.hybrid.network/](http://stakepool1.testnet.hybrid.network/ "http://stakepool1.testnet.hybrid.network/")

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

### 4 test

* 待续

### 5.docker run

* docker build -t hcash:0.1.0 .
* docker run --name=hcashtestnet -d hcash:0.1.0
* docker exec -ti hcashtestnet bash


* hxwallet -u user -P pass --create
* hxwallet -u user -P pass --testnet

### 参考文章
* http://mp.weixin.qq.com/s/BJ30ViU0RPrTm6t54F31KA
* git hcash仓库：https://github.com/hybridnetwork
* git 文档：https://github.com/nisang/hcash-record

### 其他
* 服务器购买 https://www.vultr.com
