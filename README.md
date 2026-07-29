# PIML-PyScrew-Benchmarks
This repository contains the codebase, Jupyter Notebooks, Docker configurations, and environment requirements for the machine learning models developed during this Master's thesis for the investigation, if Physics informed Machine Learning can improve the classification task in screw driving processes.

> **Important Note on Data & Complete Run:** > Due to file size limitations (e.g., large datasets and model weights), this GitHub repository contains **only the pure codebase** (Notebooks, Dockerfiles, and dependencies). 
> To run the models, you must follow instructions, to install important files and getting a key, from huggingface for running TabPFN.

# Repository Structure
The project is split into two seperate, fully isolated environment to prevent any dependencies conflicts. The Benchmark of UniShape needs different environment dependencies, therefore for unishape a separate Dockerfile and requirements is needed. Therefore the Unishape benchmark is completely separated in this repository.

## Repository Architecture

The repository is structured as follows:

```text
.
├── PIML_Features/
│   └── Different physics-informed feature approaches
│   └── screw_data_s02-v2_identival-to-v1.pkl  (must be transfered into this file)
│
├── PIML_Loss/
│   └── Different physics-informed loss approaches
│   └── screw_data_s02-v2_identival-to-v1.pkl (must be transfered into this file)
│
├── ConvTran/                         
│   └── External repository (see instructions)
│
├── Time-Series-Library/              
│   └── External repository (see instructions)
│
├── UniShape/                         
│   └── External repository (see instructions)
│
├── ConvTran.ipynb                    
│   └── ConvTran experiment
│
├── FourierNeuralOperator.ipynb       
│   └── Fourier Neural Operator experiment
│
├── InceptionTime.ipynb                
│   └── InceptionTime experiment
│
├── RF-MLP.ipynb                      
│   └── Classical ML baselines
│
├── TabPFN.ipynb                      
│   └── Foundation model experiment
│
├── TimesNet.ipynb                    
│   └── TimesNet experiment
│
├── Transformer-AllYouNeedIsAttention.ipynb
│   └── Transformer baseline
│
├── Untersuchungen.ipynb              
│   └── Additional analysis
│
├── Dockerfile                        
│   └── Reproducible environment for Benchmarks, Features and Losses, excluding UniShape Benchmark
|
├── screw_data_s02-v1.pkl                        
│   └── must be inserted 
|
├── screw_data_s02-v2_identical-to-v1.pkl                        
│   └── must be inserted
│
├── requirements.txt                  
│   └── Python dependencies for Benchmarks, Features and Losses, excluding UniShape Benchmark
│
└── README.md
```

# How to run - Instructions
The databases are zipped in the folder .\data. You need to unzip them. 
Then you need to place **screw_data_s02-v2_identical-to-v1.pkl** in 

> Building docker image
```bash
docker build -t thesis-benchmarks .
```

> Running docker image and opened via http://localhost:8888/lab?token=thesis2026 in your browser
```bash
docker run -it --rm -p 8888:8888 -v "%cd%:/workspace" --name thesis-run thesis-benchmarks jupyter lab --ip=0.0.0.0 --allow-root --no-browser --ServerApp.token="thesis2026"
```

# Database Setup
The database comes from mikolaiwest PyScrew screwdriving experimentations. More information on the PyScrew data and Repository is available here: https://github.com/nikolaiwest/pyscrew

In order to create the exact database and to run the files, you need to create the pickle databases.
```python
import pyscrew
import pandas as pd
data = pyscrew.get_data(scenario="s02", handle_duplicates="first", handle_missings="mean", force_download=True, target_length=800)
df = pd.DataFrame(data)
df.to_pickle("screw_data_s02-v1.pkl")
df.to_pickle("screw_data_s02-v2_identical-to-v1.pkl ")
```


