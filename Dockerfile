FROM ubuntu
# FROM nvcr.io/nvidia/rapidsai/rapidsai-core:22.10-cuda11.5-runtime-ubuntu20.04-py3.9

RUN apt-get update && apt-get install -y curl wget git vim

RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh
RUN bash Mambaforge-Linux-x86_64.sh -b

RUN mamba install python cuda cudatoolkit rapids pytorch torchvision torchaudio pyg jupyter pandas -y -n base -c rapidsai -c nvidia -c pytorch -c pyg -c conda-forge

# RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
# RUN bash ~/miniconda.sh -b -p $HOME/miniconda

# RUN ~/miniconda/bin/conda init

# RUN ~/miniconda/bin/conda install -y cuda -c nvidia/label/cuda-11.3.2
# RUN ~/miniconda/bin/conda install -y rapids=22.10 python=3.9 cudatoolkit=11.5 -c rapidsai -c nvidia -c conda-forge
# RUN ~/miniconda/bin/conda install -y pytorch==1.11.0 torchvision==0.12.0 torchaudio==0.11.0 -c pytorch -c conda-forge
# RUN ~/miniconda/bin/conda install -y pyg -c pyg

# RUN ~/miniconda/bin/conda create -y -n rapids-22.10 rapids=22.10 python=3.9 cudatoolkit=11.2 pytorch==1.11.0 torchvision==0.12.0 torchaudio==0.11.0 pyg jupyter pandas -c rapidsai -c nvidia -c pytorch -c pyg -c conda-forge
# RUN ~/miniconda/bin/conda install -y jupyter pandas
# RUN pip install pathpy2