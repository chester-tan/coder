---
name: Develop in Docker
description: Run workspaces on a Docker host using registry images
tags: [local, docker]
icon: /icon/docker.png
---

# 24 March 2023

This latest ML4Nets Coder Template as of 24 March 2023 builds Workspaces with `miniconda` and `juliaup` installed in the user's home directory, with 2 Conda environments preinstalled:
* `gt` contains the following preinstalled packages:
    * `python=3.10`
    * `graph-tool` 
    * `pathpy` 
    * `networkx` 
    * `igraph` 
    * `jupyter` 
    * `scipy` 
    * `numpy` 
    * `pandas` 
    * `matplotlib` 
    * `seaborn`
* `pyg` contains the following preinstalled packages:
    * `cuda=11.8`
    * `cudatoolkit=11.8`
    * `python=3.10`
    * `rapids=23.02`
    * `torch`
    * `torchvision` 
    * `torchaudio`
    * `torch_geometric` 
    * `pyg_lib`
    * `torch_scatter` 
    * `torch_sparse` 
    * `torch_cluster` 
    * `torch_spline_conv` 
    * `captum` 
    * `torchdyn`
    * `pathpy` 
    * `networkx` 
    * `igraph` 
    * `jupyter` 
    * `scipy` 
    * `numpy` 
    * `pandas` 
    * `matplotlib` 
    * `seaborn`

## Highlights

This Template contains PyTorch 2.0 and PyTorch Geometric 2.3 which are the first versions also compatible with RAPIDS (23.02) on CUDA 11.8. 

## Known Issues

* The current versions of `graph-tool` and PyTorch are incompatible due to conflicting `libgomp` dependencies, which is why they have to be installed in separate Conda environments.
* `torchdyn` has a faulty installation

## Dockerfile

```
FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
	&& apt-get install -y \
	curl \
	git \
	sudo \
	vim \
	wget \
	htop \
	zip \
	expect \
	libnuma-dev \
	&& rm -rf /var/lib/apt/lists/*

ARG USER=coder
RUN useradd --groups sudo --no-create-home --shell /bin/bash ${USER} \
	&& echo "${USER} ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/${USER} \
	&& chmod 0440 /etc/sudoers.d/${USER}
USER ${USER}
WORKDIR /home/${USER}

RUN expect -c 'spawn bash -c "curl -fsSL https://install.julialang.org | sh"; expect "Proceed"; send -- "\r"; expect eof'

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /home/${USER}/.miniconda.sh
RUN bash /home/${USER}/.miniconda.sh -b -p /home/${USER}/.miniconda
RUN /home/${USER}/.miniconda/bin/conda init

RUN /home/${USER}/.miniconda/bin/conda create --name gt -y \
	-c conda-forge \ 
	python=3.10 \
	graph-tool 

RUN /home/${USER}/.miniconda/envs/gt/bin/pip install \
	pathpy \
	networkx \
	igraph \
	jupyter \
	scipy \
	numpy \
	pandas \
	matplotlib \
	seaborn

RUN /home/${USER}/.miniconda/bin/conda create --name pyg -y \
	-c rapidsai \
	-c conda-forge \ 
	-c nvidia \
	cuda=11.8 \
	cudatoolkit=11.8 \
	python=3.10 \
	rapids=23.02 

RUN /home/${USER}/.miniconda/envs/pyg/bin/pip install \
	torch \
	torchvision \
	torchaudio \
	--index-url https://download.pytorch.org/whl/cu118

RUN /home/${USER}/.miniconda/envs/pyg/bin/pip install \
	torch_geometric \
	pyg_lib \
	torch_scatter \
	torch_sparse \ 
	torch_cluster \
	torch_spline_conv \
	-f https://data.pyg.org/whl/torch-2.0.0+cu118.html

RUN /home/${USER}/.miniconda/envs/pyg/bin/pip install \
	captum \
	torchdyn

RUN /home/${USER}/.miniconda/envs/pyg/bin/pip install \
	pathpy \
	networkx \
	igraph \
	jupyter \
	scipy \
	numpy \
	pandas \
	matplotlib \
	seaborn
```