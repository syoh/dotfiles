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
WORKDIR /home/${USER}

RUN git clone https://github.com/TheLocehiliosan/yadm.git ~/.local/yadm-project && \
    ln -s ~/.local/yadm-project/yadm ~/.local/bin/yadm

# Install miniconda
ENV CONDA_DIR ~/.local/conda
RUN curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p ${CONDA_DIR}

# Put conda in path so we can use conda activate
ENV PATH $CONDA_DIR/bin:$PATH