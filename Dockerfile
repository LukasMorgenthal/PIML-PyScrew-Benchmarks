# Python image
FROM python:3.12-slim

#Arbeitsverzeichnis
WORKDIR /workspace

#Requirements kopieren und installieren
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

#jupylab installieren
RUN pip install --no-cache-dir jupyterlab

#alles auf container kopieren
COPY . .

#port für jupyter freimachen
EXPOSE 8888

#jupylab direkt starten command
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]