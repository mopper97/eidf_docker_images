# Start from the official NVIDIA PyTorch image that includes all the goodies for top distributed and singla node Pytorch
FROM nvcr.io/nvidia/cuda:12.0.0-cudnn8-devel-ubuntu22.04

# Set default shell to bash
SHELL ["/bin/bash", "-c"] 

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC


# Update system
RUN apt-get update
RUN apt-get upgrade -y

# Install favourite tools
RUN apt-get install -y \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libgdbm-dev \
    libdb5.3-dev \
    libbz2-dev \
    libexpat1-dev \
    liblzma-dev \
    tk-dev \
    libffi-dev \
    wget \
    git \
    nano

ENV PYTHON_VERSION 3.9.18

RUN wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tar.xz \
    && tar -xf Python-$PYTHON_VERSION.tar.xz \
    && cd Python-$PYTHON_VERSION \
    && ./configure --enable-optimizations \
    && make -j 8 \
    && make altinstall \
    && rm -rf Python-$PYTHON_VERSION.tar.xz Python-$PYTHON_VERSION

RUN ls /usr/local/bin/  # Lists all files in the directory

# Creating a symbolic link for python3.9
RUN ln -s /usr/local/bin/python3.9 /usr/local/bin/python

# Creating a symbolic link for pip3.9
RUN ln -s /usr/local/bin/pip3.9 /usr/local/bin/pip

# Verifying the Python and pip versions
RUN python --version
RUN pip --version
