# Use an official Python runtime as a parent image
FROM continuumio/miniconda3:latest

# Set the working directory in the container
WORKDIR /app

# Copy the environment.yml file into the container at /app
COPY environment.yml .

# Create the conda environment
RUN conda env create -f environment.yml
# Activate the conda environment
# SHELL ["conda", "activate", "-n", "flask_app_env", "/bin/bash", "-c"]
# SHELL ["conda", "init","/bin/bash", "-c"]
# # SHELL ["conda", "activate","flask-app-env", "/bin/bash", "-c"]
SHELL ["conda", "run", "-n", "fresh_flask", "/bin/bash", "-c"]
COPY . .
# RUN  conda init
RUN pip install -r requirements.txt

# RUN activate new_flask_env

# RUN pip install flask

# Make port 5000 available to the world outside this container
EXPOSE 5000
ENV FLASK_APP="app.py"

RUN conda clean -a
CMD ["conda", "run", "-n", "fresh_flask", "python", "app.py"]

