# Use an official Python runtime as a parent image
FROM continuumio/miniconda3:latest

# Set the working directory in the container
WORKDIR /app

# Copy the environment.yml file into the container at /app
COPY new_flask_env.yml /app

# Create the conda environment
RUN conda env create -f new_flask_env.yml
# Activate the conda environment
# SHELL ["conda", "activate", "-n", "flask_app_env", "/bin/bash", "-c"]
# SHELL ["conda", "init","/bin/bash", "-c"]
# # SHELL ["conda", "activate","flask-app-env", "/bin/bash", "-c"]
SHELL ["conda", "run", "-n", "new_flask_env", "/bin/bash", "-c"]
# RUN  conda init


# RUN activate new_flask_env

# RUN pip install flask
# Copy the rest of the application code
COPY . /app

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV FLASK_APP=main.py


# Run app.py when the container launches
CMD ["python", "main.py"]