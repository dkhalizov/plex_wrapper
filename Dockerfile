FROM --platform=linux/amd64 plexinc/pms-docker:latest

RUN apt-get update && apt-get install -y \
    i965-va-driver \
    libva-drm2 \
    libva-x11-2 \
    libva2 \
    vainfo \
    && rm -rf /var/lib/apt/lists/*

RUN getent group video2 || groupadd -g 44 video2 && \
    usermod -a -G video2 plex || true
