FROM nvcr.io/nvidia/pytorch:23.05-py3

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
	&& rm -rf /var/lib/apt/lists/*

RUN pip install \
	torch_geometric \
	captum \
	pathpy \
	networkx \
	igraph \
	jupyter \
	scipy \
	numpy \
	pandas \
	matplotlib \
	seaborn
