#!/bin/bash

#${VARIABLE} are located in the .env file
jupyter-notebook --no-browser --notebook-dir=/home/${JUPYTER_USER}/notebooks --ip=0.0.0.0 --port ${JUPYTER_PORT}
