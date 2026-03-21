FROM ubuntu:24.04

# ... (manter as dependências de runtime)

# -----------------------------
# Argumentos (O Jenkins passará o PROJECT_NAME aqui)
# -----------------------------
ARG BUILD_DIR=build/Release
ARG PROJECT_NAME=cpp-template

# Definimos uma variável de ambiente para o CMD usar
ENV EXE_NAME=${PROJECT_NAME}

WORKDIR /app

# -----------------------------
# Copiar apenas o binário final
# -----------------------------
# Como o CMake gera o binário dentro da pasta de build, 
# vamos copiar o conteúdo da pasta de build para o /app
COPY ${BUILD_DIR}/${PROJECT_NAME} /app/

# -----------------------------
# Permissão e Execução
# -----------------------------
RUN chmod +x /app/${EXE_NAME}

# Usamos a variável de ambiente para rodar o binário correto
CMD ./$EXE_NAME