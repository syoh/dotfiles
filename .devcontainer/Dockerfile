FROM ubuntu:22.04

ARG DEFAULT_USERNAME someuser
ENV USER ${DEFAULT_USERNAME}

RUN apt-get update \
  && apt-get install -y \
        curl \
        sudo \
        git \
        zsh \
  && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/zsh ${USER} && \
    usermod -aG sudo ${USER} && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ${USER}
WORKDIR /home/${USER}
ENV PATH=/home/${USER}/bin:$PATH

RUN mkdir ~/bin && \
    git clone https://github.com/TheLocehiliosan/yadm.git ~/.yadm-project && \
    ln -s ~/.yadm-project/yadm ~/bin/yadm

# Install miniconda
ENV CONDA_DIR ~/conda
RUN curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o ~/miniconda.sh && \
     /bin/bash ~/miniconda.sh -b -p ~/conda

# Put conda in path so we can use conda activate
ENV PATH=$CONDA_DIR/bin:$PATH