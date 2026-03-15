Para criar um novo serviço:

1. Criar repo a partir do template
2. Renomear pasta
3. Rodar:

conan install . --output-folder=build --build=missing
cmake -B build
cmake --build build