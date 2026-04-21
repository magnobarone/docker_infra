# Use a mesma versão que está no seu pyproject.toml
FROM python:3.12-slim

# Instala o poetry
RUN pip install --no-cache-dir poetry

# Configura o poetry para não criar ambiente virtual (instala direto no container)
RUN poetry config virtualenvs.create false

# Define o diretório de trabalho
WORKDIR /src

# Copia apenas os arquivos de dependências primeiro
COPY pyproject.toml poetry.lock* /src/

# Instala as dependências (sem o projeto em si)
RUN poetry install --no-interaction --no-ansi --no-root

# Agora copia o restante dos arquivos (incluindo o README.md que seu toml exige)
COPY . /src

EXPOSE 8501

ENTRYPOINT [ "streamlit", "run", "app/app.py", "--server.port=8501", "--server.address=0.0.0.0" ]