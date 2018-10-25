Title: nvidia

- Verify linux nvidia drivers are installed: `nvidia-smi`
- Verify linux nvidia drivers work within docker: `docker run --runtime=nvidia --rm nvidia/cuda:9.0-base nvidia-smi`
- Show nvidia container info: `nvidia-container-cli -k -d /dev/tty info`
