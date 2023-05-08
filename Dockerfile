FROM nvcr.io/nvidia/rapidsai/rapidsai-core:23.04-cuda11.8-base-ubuntu22.04-py3.10

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

RUN pip install \
	torch \
	torchvision \
	torchaudio \
	--index-url https://download.pytorch.org/whl/cu118

RUN pip install \
	torch_geometric \
	pyg_lib \
	torch_scatter \
	torch_sparse \ 
	torch_cluster \
	torch_spline_conv \
	-f https://data.pyg.org/whl/torch-2.0.0+cu118.html

RUN pip install \
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
