FROM debian:latest

RUN apt-get update && apt-get install -y wget git curl
RUN wget https://dl.google.com/go/go1.10.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.10.linux-amd64.tar.gz
RUN echo "export PATH=$PATH:/usr/local/go/bin">>/etc/profile 
#RUN source /etc/profile
ENV PATH $PATH:/usr/local/go/bin
RUN mkdir -p $HOME/go && mkdir -p $HOME/go/src && mkdir -p $HOME/go/bin && mkdir -p $HOME/go/src/github.com && mkdir -p $HOME/go/src/github.com/hybridnetwork
RUN echo "export GOPATH=$HOME/go">>/etc/profile && echo "export PATH=$PATH:$HOME/go/bin">>/etc/profile
ENV GOPATH $HOME/go
RUN mkdir -p $GOPATH/bin
RUN mkdir -p $GOPATH/src
ENV PATH $PATH:$HOME/go/bin
# && source /etc/profile

RUN curl https://glide.sh/get | sh


WORKDIR $HOME/go/src/github.com/hybridnetwork
RUN git clone https://github.com/hybridnetwork/hxd
RUN git clone https://github.com/hybridnetwork/hxwallet

WORKDIR $HOME/go/src/github.com/hybridnetwork/hxd
RUN glide install
RUN go install $(glide nv)
WORKDIR $HOME/go/src/github.com/hybridnetwork/hxwallet
RUN glide install
RUN go install $(glide nv)

CMD ["hxd","-u user -P pass --testnet"]
