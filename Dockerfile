FROM ubuntu:24.04

# -----------------------------
# Dependências de build
# -----------------------------
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    cmake \
    libfmt-dev \
    libgtest-dev && \
    rm -rf /var/lib/apt/lists/*

# -----------------------------
# Nome do executável (customizável)
# -----------------------------
ARG APP_NAME=app
ENV APP_NAME=${APP_NAME}

# -----------------------------
# Diretório de trabalho
# -----------------------------
WORKDIR /app

# -----------------------------
# Copiar código
# -----------------------------
COPY . .

# -----------------------------
# Build
# -----------------------------
RUN rm -rf build && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make

# -----------------------------
# Execução
# -----------------------------
CMD ["sh", "-c", "./build/${APP_NAME}"]