# oscar_host

## Local development

```
$ git clone git@github.com:aetiologicCanada/oscar_host.git
$ cd oscar_host
$ docker image build -t oscar_host:local_dev .
$ docker container run --name petunia -d oscar_host:local_dev /bin/bash
$ docker container exec -it petunia /bin/bash
```

The names `local_dev` and `petunia` are arbitrary.

## Deployment

```
docker login
docker image build -t oscar_host:0.1.0 . 
docker image tag oscar_host:0.1.0 evidentlyslocker/oscar_host:0.1.0
docker image push evidentlyslocker/oscar_host:0.1.0
```

The tags follow [Semantic Versioning](https://semver.org/) with `major.minor.patch`.
