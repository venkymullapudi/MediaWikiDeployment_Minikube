
### Push the Docker images to Docker Private Registry

Update the Docker Daemon Startup options
```
vi usr/lib/systemd/system/docker.service
ExecStart=/usr/bin/dockerd --insecure-registry dockerregistry.venky.corp:5000
```

Restart Docker
```
systemctl daemon-reload
service docker restart
```

Tag the image with the repository
```
docker tag <Nexus-image-id> "dockerregistry.venky.corp:5000/nexus3"
```

Push the image to the private docker registry
```
docker push dockerregistry.venky.corp:5000/nexus3
```
