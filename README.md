# oscar_host

## Local development

First install Docker CE. Then...

```
$ git clone git@github.com:aetiologicCanada/oscar_host.git
$ cd oscar_host
$ docker image build -t oscar_host:local_dev .
$ docker container run --name petunia -d oscar_host:local_dev /bin/bash
$ docker container exec -it petunia /bin/bash
```

That will give you shell access to the running container to experiment.
The names `local_dev` and `petunia` are arbitrary.

## Deployment

Deploy to this [Evidently Docker Hub Repository](https://hub.docker.com/repository/docker/evidentlyslocker/oscar_host).

```
docker login
docker image build -t oscar_host:0.1.0 . 
docker image tag oscar_host:0.1.0 evidentlyslocker/oscar_host:0.1.0
docker image push evidentlyslocker/oscar_host:0.1.0
```

The tags follow [Semantic Versioning](https://semver.org/) with `major.minor.patch`.

