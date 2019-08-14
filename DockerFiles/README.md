Build the Docker images using the below command
```
docker build -t .
```

Run the Docker Registry and the Nexus containers using the commands below
```
docker run -d -p 5000:5000 --restart always --name registry registry:2
```

```
docker run -d -p 8081:8081 --name nexus sonatype/nexus3
```
