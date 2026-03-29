FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    libstdc++6 \
    libfmt-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY build/Release/executable /app/executable

RUN chmod +x /app/executable

CMD ["/bin/bash", "-c", "/app/executable && sleep infinity"]