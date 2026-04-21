FROM python:3.12-slim
RUN pip install --no-cache-dir poetry
RUN poetry config virtualenvs.create false
COPY . /src
WORKDIR /src
RUN poetry install --no-insteraction --no-ansi --no-root
EXPOSE 8501
ENTRYPOINT [ "poetry", "run", "streamlit", "run" ,"app/app.py", "--server.port=8501", "server.address=0.0.0.0" ]