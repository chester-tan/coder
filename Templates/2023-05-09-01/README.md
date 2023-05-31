---
name: Develop in Docker
description: Run workspaces on a Docker host using registry images
tags: [local, docker]
icon: /icon/docker.png
---

# 31 May 2023

This latest ML4Nets Coder Template as of 31 May 2023 builds Workspaces based on the NVIDIA container for PyTorch, release 23.05, with the following additional preinstalled Python packages:

- `torch_geometric`
- `captum`
- `pathpy`
- `networkx`
- `igraph`
- `jupyter`
- `scipy`
- `numpy`
- `pandas`
- `matplotlib`
- `seaborn`

The NVIDIA container for PyTorch is based on Ubuntu 22.04, Python 3.10, and CUDA 12.1.1, and includes:

- NVIDIA RAPIDS 23.04
  - `cuDF`
  - `cuML`
  - `cuGraph`
  - `cuSpatial`
  - `cuXFilter`
  - `cuSignal`
  - `cuCIM`

among other useful pre-installed software. Please refer to these release notes for further information on the NVIDIA container for PyTorch, release 23.05 https://docs.nvidia.com/deeplearning/frameworks/pytorch-release-notes/rel-23-05.html#rel-23-05

## Highlights

This Template contains PyTorch 2.0.0 ("with a cherry-pick to fix potential performance regressions via [#97838](https://github.com/pytorch/pytorch/pull/97838)"), PyTorch Geometric 2.3.1, RAPIDS 23.04 (including `cuDF`, `cuML`, `cuGraph`, `cuSpatial`, `cuXFilter`, `cuSignal`, and `cuCIM`).

## Usage

Preinstalled Python packages are installed via `pip` system-wide. It is recommended to work with Python virtual environments using `venv` (_`conda` is not preinstalled and not recommended!_). Creating a virtual environment with `venv` anywhere in `/home/${USER}` directory should allow user-installed packages to the virtual environment to persist across Workspace restarts.

**Example usage**

To create a virtual environment with preinstalled packages, use the argument `--system-site-packages`. For example: \
`python -m venv --system-site-packages /home/${USER}/path/to/new/virtual/environment`

To create a virtual environment without any preinstalled, simply omit the argument `--system-site-packages`. For example: \
`python -m venv /home/${USER}/path/to/new/virtual/environment`

For more information on how to use `venv`, please refer to https://docs.python.org/3.10/library/venv.html

## Known Issues

- Optional additional libraries for PyTorch Geometric (`pyg_lib torch_scatter torch_sparse torch_cluster torch_spline_conv`) are not available as they require CUDA 11.7 or 11.8 and are not compatible with CUDA 12.1.1 pre-installed in the NVIDIA container for PyTorch, release 23.05.

## Docker Image

https://hub.docker.com/layers/ml4nets/ml4nets/latest/images/sha256-9c300c32ab9948ed5f23e61d5574bd772ef6e223347abf22ec695fd033e2a497?context=explore
