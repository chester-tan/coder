# FROM ubuntu
FROM nvcr.io/nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
	&& apt-get install -y \
	python3 \
	python3-pip \
	python3-venv \
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

RUN python3 -m pip install --upgrade setuptools pip wheel
RUN python3 -m pip install nvidia-pyindex
RUN python3 -m pip install pip install cuda-python==11.8.0
# RUN python3 -m pip install nvidia-cuda-runtime-cu11==11.8.89 
# RUN python3 -m pip install \
# 	nvidia-cuda-cupti-cu11 \
# 	nvidia-cuda-nvcc-cu11 \
# 	nvidia-nvml-dev-cu11 \
# 	nvidia-cuda-nvrtc-cu11 \
# 	nvidia-nvtx-cu11 \
# 	nvidia-cuda-sanitizer-api-cu11 \
# 	nvidia-cublas-cu11 \
# 	nvidia-cufft-cu11 \
# 	nvidia-curand-cu11 \
# 	nvidia-cusolver-cu11 \
# 	nvidia-cusparse-cu11 \
# 	nvidia-npp-cu11 \
# 	nvidia-nvjpeg-cu11 \
# 	nvidia-nvjitlink-cu11 \
# 	nvidia-cuda-opencl-cu11

RUN python3 -m pip install \
	cudf-cu11 \
	cuml-cu11 \
	cugraph-cu11 \
	cucim \
	--extra-index-url=https://pypi.nvidia.com

RUN python3 -m pip install \
	torch \
	torchvision \
	torchaudio \
	--index-url https://download.pytorch.org/whl/cu118

# RUN python3 -m pip install \
# 	torch \
# 	torchvision \
# 	torchaudio \
# 	--index-url https://download.pytorch.org/whl/cu118

# RUN python3 -m pip install \
# 	torch_geometric \
# 	pyg_lib \
# 	torch_scatter \
# 	torch_sparse \ 
# 	torch_cluster \
# 	torch_spline_conv \
# 	-f https://data.pyg.org/whl/torch-2.0.0+cu118.html

# RUN python3 -m pip install \
# 	captum \
# 	torchdyn

# RUN python3 -m pip install \
# 	pathpy \
# 	networkx \
# 	igraph \
# 	jupyter \
# 	scipy \
# 	numpy \
# 	pandas \
# 	matplotlib \
# 	seaborn
