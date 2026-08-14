# Grafana_12.2.1 (ARM64) | Active SSH

_general info:_

- Grafana_12.2.1 on alpine-minirootfs-aarch64 (linux/aarch64)
- Active SSH
- Expose ssh 22 (3332:22), http 3000 (3330:3000)
- Built and tested on ARM64 device (ZTE B860H v.2) with Armbian Community v25.11 running:
```
https://github.com/armbian/community/releases/download/25.11.0-trunk.472/Armbian_community_25.11.0-trunk.472_Aml-s9xx-box_trixie_current_6.12.57_minimal.img.xz
```
---

## Quick Start

### Pull Image
```bash
docker pull ftoweren/grafana-alpine-minirootfs-aarch64:202512-01
```

### Run Container (Depends on Your Docker bridge/macvlan)
```bash
docker run -itd --name grafana-alpinemrfs-aarch64 \
	--hostname grafana-alpinemrfs-aarch64 \
	-v grafana_storage:/var/lib/grafana \
	-p 3332:22 -p 3330:3000 \
	--restart always \
	ftoweren/grafana-alpine-minirootfs-aarch64:202512-01 /bin/sh
```

### Post-Installation Management
change OS root password from exec -it running container (if needed):
```bash
docker exec -it grafana-alpinemrfs-aarch64 passwd
```
---

## Build from Source

### Build Docker Image
```
docker build --no-cache -f path/Dockerfile -t image_name:tag .
```
