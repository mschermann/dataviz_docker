# Docker Container for Data Analytics

## Installation

### Prerequisites
Make sure that you have git installed. Open a Terminal/Command Prompt and type the following:
```
git --version
```
You should see an output like this:
```
git version 2.11.0 (Apple Git-81)
```
If you do get a 'Not found' error, you need to install git. Follow the instructions (here)[https://git-scm.com/downloads]. I also recommend that you install the (github Desktop)[https://help.github.com/desktop/guides/getting-started/installing-github-desktop/]. It makes managing git repositories easy and user-friendly.

### 1. Clone this repository to a folder
Open a Terminal/Command Prompt and navigate to a folder that you have setup for the container.
```
cd ~/YOUR_FOLDER #Change this
git clone https://github.com/mschermann/dataviz_docker
```

### 2. Install Docker & Docker-compose from
Go to (https://www.docker.com/community-edition)[https://www.docker.com/community-edition] and install docker for your operating system

### 3. Make sure that docker is correctly installed
Open a Terminal/Command Prompt and type the following:
```
docker-compose -v
```
You should see an output like this:
```
docker-compose version 1.14.0, build c7bdf9e
```
### 4. Build the docker Container
```
docker-compose up
```
This will initialize the container, download all required libraries, and starts jupyter. **Please note: This may take a while.** If everything works, you should see something like this.
```
jupyter_1  | [I 04:55:47.107 NotebookApp] [jupyter_nbextensions_configurator] enabled 0.2.7
jupyter_1  | [I 04:55:47.109 NotebookApp] Serving notebooks from local directory: /home/dv/notebooks
jupyter_1  | [I 04:55:47.110 NotebookApp] 0 active kernels
jupyter_1  | [I 04:55:47.110 NotebookApp] The Jupyter Notebook is running at:
jupyter_1  | [I 04:55:47.110 NotebookApp] http://0.0.0.0:8888/?token=ABCDEFGHIJ
jupyter_1  | [I 04:55:47.110 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
jupyter_1  | [C 04:55:47.111 NotebookApp]
jupyter_1  |     
jupyter_1  |     Copy/paste this URL into your browser when you connect for the first time,
jupyter_1  |     to login with a token:
jupyter_1  |         http://0.0.0.0:8888/?token=ABCDEFGHIJ
```

### 5. Open Jupyter
Copy the URL mentioned in the console. In the above example, it would be:
```
http://0.0.0.0:8888/?token=ABCDEFGHIJ
```
Paste this into your browser. It should open the Jupyter notebook. You should see an empty folder.
![Jupyter Start Screen](https://github.com/mschermann/dataviz_docker/assets/jupyter.png)
