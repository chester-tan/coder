# FROM ubuntu
FROM tensorflow/tensorflow:1.15.5-gpu-py3-jupyter

# ENV DEBIAN_FRONTEND=noninteractive
# RUN apt-get update \
# 	&& apt-get install -y \
# 	curl \
# 	git \
# 	sudo \
# 	vim \
# 	wget \
# 	htop \
# 	zip \
# 	expect \
# 	libnuma-dev \
# 	&& rm -rf /var/lib/apt/lists/*

ARG USER=coder
RUN useradd --groups sudo --no-create-home --shell /bin/bash ${USER} \
	&& echo "${USER} ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/${USER} \
	&& chmod 0440 /etc/sudoers.d/${USER}
USER ${USER}
WORKDIR /home/${USER}

# RUN expect -c 'spawn bash -c "curl -fsSL https://install.julialang.org | sh"; expect "Proceed"; send -- "\r"; expect eof'

# RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /home/${USER}/miniconda.sh
# RUN bash /home/${USER}/miniconda.sh -b -p /home/${USER}/miniconda
# RUN /home/${USER}/miniconda/bin/conda init
# RUN /home/${USER}/miniconda/bin/conda create --name default -y \
# 	-c nvidia/label/cuda-10.0 \
# 	python=3.7 \
# 	cuda cudatoolkit

# RUN /home/${USER}/miniconda/envs/default/bin/pip install \
# 	torch \
# 	torchvision \
# 	torchaudio \
# 	--extra-index-url https://download.pytorch.org/whl/cu117

# RUN /home/${USER}/miniconda/envs/default/bin/pip install \
# 	pyg_lib \
# 	torch_scatter \
# 	torch_sparse \ 
# 	torch_cluster \
# 	torch_spline_conv \
# 	torch_geometric \
# 	-f https://data.pyg.org/whl/torch-1.13.1+cu117.html

# RUN /home/${USER}/miniconda/envs/default/bin/pip install \
# 	torchdyn

# RUN /home/${USER}/miniconda/envs/default/bin/pip install \
# 	networkx \
# 	jupyter \
# 	scipy \
# 	pandas \
# 	seaborn

RUN pip install \
	"absl-py" \
	"graph-nets>=1.1" \
	"tensorflow-gpu>=1.15,<2" \
	"numpy" \
	"dm-sonnet<2" \
	"tensorflow_probability<0.9" \
	"sklearn" \
	"dm-tree" \
	"matplotlib"
