FROM ubuntu:22.04

ENV USER someuser

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
ENV HOME /home/${USER}
WORKDIR ${HOME}
RUN mkdir -p ${HOME}/.local/bin
ENV PATH ${HOME}/.local/bin:$PATH

RUN git clone https://github.com/TheLocehiliosan/yadm.git ~/.local/yadm-project && \
    ln -s ~/.local/yadm-project/yadm ~/.local/bin/yadm

# Install miniconda
ENV CONDA_DIR ~/.local/conda
RUN curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p ~/.local/conda && \
    rm ~/miniconda.sh
ENV PATH ${HOME}/.local/conda/bin:$PATH