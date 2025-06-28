FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    wget \
    libpci-dev \
    kmod \
    msr-tools \
    hwloc \
    numactl \
    ocl-icd-libopencl1 \
    clinfo \
    opencl-headers \
    && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /opt/srbminer

# Download and extract SRBMiner (.tar.gz)
RUN wget -O /tmp/SRBMiner-Multi-2-9-3-Linux.tar.gz https://github.com/doktor83/SRBMiner-Multi/releases/download/2.9.3/SRBMiner-Multi-2-9-3-Linux.tar.gz \
    && tar -xzf /tmp/SRBMiner-Multi-2-9-3-Linux.tar.gz -C /opt/srbminer --strip-components=1 \
    && rm /tmp/SRBMiner-Multi-2-9-3-Linux.tar.gz

WORKDIR /opt/srbminer

CMD ["./SRBMiner-MULTI", "--help"]


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]