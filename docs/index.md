# Welcome to RadioGaGa documentation 

Je test une modif
Link : [svn/NenuFar/trunk/receivers/RadioGAGA/doc/](https://svn.obs-nancay.fr/svn/NenuFar/trunk/receivers/RadioGAGA/doc/)  
!!! Todo
    - [X] Finish to complete startup sequence
    - [X] Add path of configuration files
    - [ ] Running mode, monitor ?  
    - [ ] Trigger doc
    - [X] PyFDa doc

## Install docker
This documentation uses mkdocs (documentation : [mkdocs-material-docs](https://squidfunk.github.io/mkdocs-material/) )
 To avoid to install all dependencies needed, a dockerfile is set in the doc directory. 
You need to have docker installed on your machine.  
You can download it [here](https://docs.docker.com/engine/install/)

=== "For ubuntu : " 

    ``` console
    sudo apt-get update

    sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io

    echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io

    ```

### Run Docker commands without sudo

#### 1. Add the `docker` group if it doesn't already exist

```console
sudo groupadd docker
```

#### 2. Add the connected user `$USER` to the docker group

Optionally change the username to match your preferred user.

```console
sudo gpasswd -a $USER docker
```

!!! important 
    Log out and log back in so that your group membership is re-evaluated.

#### 3. Restart the `docker` daemon

```console
sudo service docker restart
```

If you are on Ubuntu 14.04-15.10, use `docker.io` instead:

```console
sudo service docker.io restart
```


## Commands
* `./build_docker.sh` - Build the docker image 
* `./changelog.sh` - Update docs/changelog.md
* `./doc-build` - Build the doc and generate the PDF. 
* `./doc-serve` - Start the live-reloading docs server. You can access it here : [http://localhost:8000/](http://localhost:8000/)


