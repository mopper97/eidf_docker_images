# Start from a CUDA base image
FROM nvcr.io/nvidia/cuda:12.0.0-cudnn8-devel-ubuntu22.04

# Update system and install necessary packages
RUN apt-get update && apt-get install -y \
    wget \
    libgl1 \
    libglib2.0-0 \
    python3.9 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# launch bash
CMD ["/bin/bash"]