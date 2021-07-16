# Nvidia License Server

## Getting Started

1. Copy the `setup.bin` file from the license server installation package into the root of this directory.
1. Replace the MAC address and hostname in `.env`.
1. Start docker-compose:
    ```bash
    docker-compose up -d --build
    ```

The first run will take a while to initialize because the license server is installed after container creation. Use `docker-compose exec nvidia-license-server journalctl -f` to monitor progress.

By default (editable via the `.env` file), port 7070 is used for licensing client access and port 8080 is used for web GUI (for uploading licenses, etc.)

