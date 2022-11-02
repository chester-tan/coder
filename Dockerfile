FROM ubuntu

RUN apt-get update && apt-get install -y curl wget git vim 

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
RUN bash ~/miniconda.sh -b -p $HOME/miniconda

RUN ~/miniconda/bin/conda init
RUN ~/miniconda/bin/conda install -y cuda -c nvidia/label/cuda-11.6.2
RUN ~/miniconda/bin/conda install -y pytorch==1.12.1 torchvision==0.13.1 torchaudio==0.12.1 cudatoolkit=11.6 -c pytorch -c conda-forge
RUN ~/miniconda/bin/conda install -y pyg -c pyg

RUN ~/miniconda/bin/conda install -y jupyter pandas
RUN pip install pathpy2
