# Nvidia License Server

> [!IMPORTANT]  
> The license server deployed via this repo is the legacy server. NVIDIA has [deprecated this server](https://docs.nvidia.com/vgpu/news/vgpu-software-license-server-eol-notice/index.html) in vGPU version 14 and later.
> For newer vGPU versions, please use the new [NVIDIA License System (NLS)](https://docs.nvidia.com/license-system/latest/nvidia-license-system-user-guide/index.html#introduction-to-nvidia-license-system), which has
> [cloud-hosted (CLS) and on-prem (DLS) deployment options](https://docs.nvidia.com/license-system/latest/nvidia-license-system-user-guide/index.html#about-service-instances). The on-prem option now
> [natively supports](https://docs.nvidia.com/license-system/latest/nvidia-license-system-user-guide/index.html#deploying-containerized-dls-software-image) containerized environments.

## Getting Started

1. Copy the `setup.bin` file from the license server installation package into the root of this directory.
1. Replace the MAC address and hostname in `.env`.
1. Start docker-compose:
    ```bash
    docker-compose up -d --build
    ```

The first run will take a while to initialize because the license server is installed after container creation. Use `docker-compose exec nvidia-license-server journalctl -f` to monitor progress.

By default (editable via the `.env` file), port 7070 is used for licensing client access and port 8080 is used for web GUI (for uploading licenses, etc.)

