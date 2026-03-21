FROM ubuntu:24.04

# -----------------------------
# Dependências de runtime (não build!)
# -----------------------------
RUN apt-get update && \
    apt-get install -y \
    libstdc++6 \
    libfmt-dev && \
    rm -rf /var/lib/apt/lists/*

# -----------------------------
# Argumentos
# -----------------------------
ARG BUILD_DIR
ARG APP_NAME=app

ENV APP_NAME=${APP_NAME}

# -----------------------------
# Diretório de trabalho
# -----------------------------
WORKDIR /app

# -----------------------------
# Copiar binário já buildado
# -----------------------------
COPY ${BUILD_DIR}/ /app/

# -----------------------------
# Permissão (caso necessário)
# -----------------------------
RUN chmod +x /app/${APP_NAME} || true

# -----------------------------
# Execução
# -----------------------------
CMD ["sh", "-c", "./${APP_NAME}"]