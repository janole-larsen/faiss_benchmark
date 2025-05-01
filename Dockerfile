# 1) Basis-Image mit Miniconda
FROM continuumio/miniconda3:latest

# 2) Arbeitsverzeichnis
WORKDIR /app

# 3) environment.yml kopieren und Env anlegen
COPY environment.yml .
RUN conda env create -f environment.yml && \
    conda clean -afy

# 4) Standard-Python aus der neuen Env verwenden
ENV PATH=/opt/conda/envs/faiss-env/bin:$PATH

# 5) Single-Threaded-Mode für deterministische Benchmarks
ENV OMP_NUM_THREADS=1

# 6) Default-Command: Login-Shell in der Env
CMD ["bash","-l"]