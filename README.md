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

## Application Responsibilities and General Design

The end-user is an Oscar Service Provider (OSP).

1. End-user runs our docker image and configures its OscarDocuments/ path.
2. End-user touches a document (e.g. `parsimony.txt`) in OscarDocuments/.
3. The `parsimony.txt` file appears in the user's directory on public.evidently.ca.

The docker image creates a container that has these tools:

- inotifywatch - to watch OscarDocuments/
- awk - to sanitize the remittance
- tar - to bundle the payload
- OpenSSL - to encrypt the TAR
- OpenSSH - to send via SCP/SFTP

The docker image creates a container that has these files:

- Orchestration script - that iNotify runs trigger the cascade
- iNotify script - to watch OscarDocumets
- awk script - to sanitize the remittance
- tar script - to bundle the remittance
- RSA Key - to encrypt the tar
- SSH Key - to authenticate SCP/SFTP

The cascade:

- Copy file(s) to Docker container
- Santize with awk
- Bundle with tar
- Encrypt with OpenSSL
- Send with OpenSSH

This description is a work in progress; please let us know if anything does not look quite right.
