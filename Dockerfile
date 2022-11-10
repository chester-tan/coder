FROM ubuntu
# FROM nvcr.io/nvidia/rapidsai/rapidsai-core:22.10-cuda11.5-runtime-ubuntu20.04-py3.9

RUN apt-get update && apt-get install -y curl wget git vim

RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh
RUN bash Mambaforge-Linux-x86_64.sh -b
# RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
# RUN bash ~/miniconda.sh -b -p $HOME/miniconda

RUN /root/mambaforge/bin/mamba init
# RUN ~/miniconda/bin/conda init

RUN /root/mambaforge/bin/mamba install cuda -y -n base -c nvidia/label/cuda-11.3.1
RUN /root/mambaforge/bin/mamba install cudatoolkit==11.3.1 python rapids==22.10 pytorch torchvision torchaudio pyg modin pandas jupyter -y -n base -c rapidsai -c nvidia -c pytorch -c pyg -c conda-forge

RUN curl -fsSL https://code-server.dev/install.sh | sh

RUN code-server --install-extension ms-python.python
RUN code-server --install-extension ms-toolsai.jupyter
RUN code-server --install-extension ms-toolsai.jupyter-keymap
RUN code-server --install-extension ms-toolsai.jupyter-renderers