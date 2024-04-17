# Docker Image for Puppet Lint

## Using the Image

1. Pull the image from Docker Hub (you only need to do this once):

    ```shell
    docker pull evolvedbinary/puppet-lint
    ```

2. To run the puppet-lint Docker image to lint all your Puppet files in the current directory:

    ```shell
    docker run --rm -v "$PWD:/puppet" evolvedbinary/puppet-lint .
    ```

    **NOTE**: The above assumes that you are in the folder containing your Puppet files when you run it.

3. or, to run the puppet-lint Docker image to lint a single Puppet file (named `my-file.pp`)  in the current directory:

    ```shell
    docker run --rm -v "$PWD:/puppet" evolvedbinary/puppet-lint my-file.pp
    ```

    **NOTE**: The above assumes that you are in the folder containing your Puppet files when you run it.

If you want to create a shorter alias, you can add this to your `~/.bashrc`, `~/.zshrc`, or `~/.profile` file:

```shell
alias docker-puppet-lint='docker run --rm -v "$PWD:/puppet" evolvedbinary/puppet-lint'
```

When the alias is in-place you can just run `docker-puppet-lint` from the folder containing your Puppet files.

## Building the Image

If you want to build a new image, you can clone this repositry and build it by running:

```shell
git clone https://github.com/evolvedbinary/docker-puppet-lint.git
cd docker-puppet-lint
docker build -t evolvedbinary/puppet-lint:4.2.4 .
docker tag evolvedbinary/puppet-lint:4.2.4 evolvedbinary/puppet-lint:latest
```

**NOTE**: You should check the version numbers above match the version numbers in the `Dockerfile` first!

### Publishing the Image
To publish the image to Docker Hub, you can run:
```shell
docker push evolvedbinary/puppet-lint:4.2.4
docker push evolvedbinary/puppet-lint:latest
```
