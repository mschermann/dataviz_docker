# Adapted from https://github.com/jupyter/docker-stacks/blob/master/base-notebook/Dockerfile
# Setup as a docker-compose
# Use Python as the baseline
FROM python:3

# Set buffer
ENV PYTHONUNBUFFERED 1

# Set Locale
ENV LOCALE en_US.UTF-8 UTF-8

#Switch to root
USER root

#apt-get-install.txt contains the minimal installation
ADD apt-get-install.txt /tmp/

# Install everything
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt-get install - y \
    apt-utils \
    build-essential \
    bzip2 \
    ca-certificates \
    git \
    locales \
    python3-gdbm \
    sudo \
    unzip \
    wget --no-install-recommends

#RUN apt-get update -y && apt-get install -y apt-utils && xargs -a /tmp/apt-get-install.txt apt-get install -y --no-install-recommends
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Now set the locale
RUN echo $LOCALE > /etc/locale.gen && locale-gen

# The requirements.txt contains all the extra Python/Jupyter libraries that will be used
ADD requirements.txt /tmp/

# Install via via everything that is mentioned in requirements.txt
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt

# Install the exentions
RUN jupyter contrib nbextension install
RUN jupyter nbextensions_configurator enable


# Set a jupyter user
ENV JUPYTER_USER dv

# Unprivileged user to run everything
RUN adduser --quiet --home /home/$JUPYTER_USER --disabled-password --gecos '' --shell /bin/bash $JUPYTER_USER

# Setup the run script
RUN adduser $JUPYTER_USER sudo
ADD run_jupyter.sh /home/$JUPYTER_USER/
RUN chmod +x /home/$JUPYTER_USER/run_jupyter.sh
RUN chown dv /home/$JUPYTER_USER/run_jupyter.sh

# Switch to the jupyter user
USER $JUPYTER_USER

# Set the matplotlib cache
ENV XDG_CACHE_HOME /home/$JUPYTER_USER/.cache/
RUN MPLBACKEND=Agg python -c "import matplotlib.pyplot"

# Copy the jupyter config


# Create the notebook folder
RUN mkdir -p /home/$JUPYTER_USER/notebooks

#Set environment variables
ENV HOME=/home/$JUPYTER_USER
ENV SHELL=/bin/bash
ENV USER=$JUPYTER_USER

