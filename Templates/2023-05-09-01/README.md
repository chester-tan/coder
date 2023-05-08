---
name: Develop in Docker
description: Run workspaces on a Docker host using registry images
tags: [local, docker]
icon: /icon/docker.png
---

# 24 March 2023

This latest ML4Nets Coder Template as of 24 March 2023 builds Workspaces with the following preinstalled Python packages:
* `python=3.10`
* `cuda=11.8`
* `cudatoolkit=11.8`
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

This Template contains PyTorch 2.0 and PyTorch Geometric 2.3.1.

## Usage

Preinstalled Python packages are installed via `pip` system-wide. It is recommended to work with Python virtual environments using `venv` (*`conda` is not preinstalled and not recommended!*). Creating a virtual environment with `venv` anywhere in `/home/${USER}` directory should allow user-installed packages to the virtual environment to persist across Workspace restarts. 

**Example usage** 

To create a virtual environment with preinstalled packages, use the argument `--system-site-packages`. For example: \
`python -m venv --system-site-packages /home/${USER}/path/to/new/virtual/environment`

To create a virtual environment without any preinstalled, simply omit the argument `--system-site-packages`. For example: \
`python -m venv /home/${USER}/path/to/new/virtual/environment`

For more information on how to use `venv`, please refer to https://docs.python.org/3.10/library/venv.html

## Known Issues

* RAPIDS packages such as `cudf` and `cugraph` have a faulty installation
* `torchdyn` has a faulty installation

## Docker Image

https://hub.docker.com/layers/ml4nets/ml4nets/latest/images/sha256-9476645064ba22b90807c18bb0314c95badad0733cfc78a785e4a05f9db62f73