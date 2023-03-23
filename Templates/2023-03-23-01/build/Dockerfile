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

RUN /home/${USER}/.miniconda/bin/conda create --name default -y \
	-c rapidsai \
	-c conda-forge \ 
	-c nvidia \
	python=3.10 \
	cuda \
	cudatoolkit=11.8 \
	rapids=23.02 \
	graph-tool

RUN /home/${USER}/.miniconda/envs/default/bin/pip install \
	torch \
	torchvision \
	torchaudio \
	--index-url https://download.pytorch.org/whl/cu118

RUN /home/${USER}/.miniconda/envs/default/bin/pip install \
	torch_geometric \
	pyg_lib \
	torch_scatter \
	torch_sparse \ 
	torch_cluster \
	torch_spline_conv \
	-f https://data.pyg.org/whl/torch-2.0.0+cu118.html

RUN /home/${USER}/.miniconda/envs/default/bin/pip install \
	captum \
	torchdyn

RUN /home/${USER}/.miniconda/envs/default/bin/pip install \
	pathpy \
	networkx \
	igraph \
	jupyter \
	scipy \
	numpy \
	pandas \
	matplotlib \
	seaborn
