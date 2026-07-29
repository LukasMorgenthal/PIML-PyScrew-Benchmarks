# PIML-PyScrew-Benchmarks
This repository contains the codebase, Jupyter Notebooks, Docker configurations, and environment requirements for the machine learning models developed during this Master's thesis for the investigation, if Physics informed Machine Learning can improve the classification task in screw driving processes.

> **Important Note on Data & Complete Run:** > Due to file size limitations (e.g., large datasets and model weights), this GitHub repository contains **only the pure codebase** (Notebooks, Dockerfiles, and dependencies). 
> To run the models, you must use the instructions, to install important files and getting a key, from huggingface for running TabPFN.

# Repository Structure
The project is split into two seperate, fully isolated environment to prevent any dependencies conflicts. The Benchmark of UniShape needs different environment dependencies, therefore for unishape is a separate Dockerfile and requirements needed.

# Repository Architecture

# How to run - Instructions
The databases are zipped in the folder .\data. You need to unzip them. 
Then you need to place **screw_data_s02-v2_identical-to-v1.pkl** in 

> Building docker image
```bash
docker build -t thesis-benchmarks .
```
```bash
docker run -it --rm -p 8888:8888 -v "%cd%:/workspace" --name thesis-run thesis-benchmarks jupyter lab --ip=0.0.0.0 --allow-root --no-browser --ServerApp.token="thesis2026"
```



