# docker-kubectl-image
Docker image containing the kubectl executable

A copy of the built version of this image can be found on my [Docker repo](https://cloud.docker.com/repository/docker/markjhollands/kubectl). To install this run:

```bash
docker pull markjhollands/kubectl
```

> **Note:** I built this image to use with Jenkins pipeline build / deployment jobs. If you are using kubectl from the command line on a workstation, you may want to just download the executable.
> **Note (2):** If you use this image to build your own images, remember not to push any keys to a public repo like Docker Hub or GitHub.

## Usage

This is a bare-bones image with alpine linux and the latest kubectl executable.

By default this image runs as the root user. To use kubectl place a valid `config` file into the `/root/.kube` directory.

If you add a different user, or wish to override the config, the kubectl tool will pull its config from the following locations, in the following order (copy and paste from the help of the `kubectl config` command):

```bash
/ # kubectl config --help
Modify kubeconfig files using subcommands like "kubectl config set current-context my-context" 

The loading order follows these rules: 

  1. If the --kubeconfig flag is set, then only that file is loaded. The flag may only be set once and no merging takes
place.  
  2. If $KUBECONFIG environment variable is set, then it is used as a list of paths (normal path delimitting rules for
your system). These paths are merged. When a value is modified, it is modified in the file that defines the stanza. When
a value is created, it is created in the first file that exists. If no files in the chain exist, then it creates the
last file in the list.  
  3. Otherwise, ${HOME}/.kube/config is used and no merging takes place.
```

## Building

To build this image run the following command:

```bash
docker build .
```
Optionally, you can name the image:

```bash
docker build -t my-kubectl-image .
```

## License
This project is licensed under [Apache License Version 2.0](LICENSE).