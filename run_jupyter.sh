#!/bin/bash

#${VARIABLE} are located in the .env file
jupyter nbextension enable varInspector/main
jupyter nbextension enable toc2/main
jupyter nbextension enable init_cell/main
jupyter nbextension enable hinterland/hinterland
jupyter nbextension enable execute_time/ExecuteTime
jupyter nbextension enable snippets_menu/main
jupyter nbextension enable exercise2/main

jupyter-notebook --no-browser --notebook-dir=/home/${JUPYTER_USER}/notebooks --ip=0.0.0.0 --port ${JUPYTER_PORT}
