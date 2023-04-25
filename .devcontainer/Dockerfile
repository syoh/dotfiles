FROM ubuntu:22.04

RUN useradd -ms /bin/bash someuser

RUN apt-get update \
  && apt-get install -y \
        sudo \
        git \
  && rm -rf /var/lib/apt/lists/*

RUN usermod -aG sudo someuser && \
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER someuser
WORKDIR /home/someuser



RUN mkdir ~/bin && \
    git clone https://github.com/TheLocehiliosan/yadm.git ~/.yadm-project && \
    ln -s ~/.yadm-project/yadm ~/bin/yadm