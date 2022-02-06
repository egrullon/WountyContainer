FROM ubuntu:21.10

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq update -y && \
    apt-get -y -qq install \
    whatweb \
    wafw00f \
    sslscan \
    git \
    golang \
    parallel \
    masscan \
    nmap \
    ffuf \
    gnupg \
    apt-utils \
    python3 \
    python3-pip \
    inetutils-ping \
    curl \
    whois \
    less \
    dnsutils \
    wget \
    findutils \
    snapd \
    host \
    vim \
    lsb-release \
    yara && \
    echo && echo "Packages Installed..." && echo

# Golang Env
RUN echo && echo "Configuring GoLang Envirioment..." && echo
ENV GOROOT="/usr/lib/go"
ENV GOPATH="/root/go"
ENV PATH="${GOPATH}/bin:${PATH}"

# Github
RUN go install github.com/tomnomnom/assetfinder@latest
RUN go install github.com/tomnomnom/httprobe@latest
RUN go install github.com/tomnomnom/waybackurls@latest
RUN go install github.com/hakluke/hakrawler@latest

RUN apt install --assume-yes chromium-browser
RUN mv /usr/bin/chromium-browser /usr/bin/chromium
RUN pip3 install dnsgen

# Wounty
RUN echo && echo "Downloading Wounty..." && echo
WORKDIR /opt/
RUN git clone https://github.com/egrullon/Wounty.git
RUN chmod +x Wounty/wounty.sh
RUN ln -s /opt/Wounty/wounty.sh /usr/local/bin/wounty
RUN echo "Wounty Script Installed"    

# Aquatone
RUN echo && echo "Installing Aquatone..." && echo
WORKDIR /opt/aquatone/
RUN wget -q https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
RUN unzip aquatone_linux_amd64_1.7.0.zip && rm -rf aquatone_linux_amd64_1.7.0.zip
RUN ln -s /opt/aquatone/aquatone /usr/local/bin/aquatone

WORKDIR /opt/projects/
CMD ["bash"]
