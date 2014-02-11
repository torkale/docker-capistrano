Docker Capistrano base image


Usage
=====

```
    docker run -v /path/to/project:/project -p 22 -v /path/to/home/.ssh:/root/.ssh -w /project/deployment fabrizzio/docker-capistrano /bin/bash -c "cap deploy"
```
