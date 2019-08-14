Note: We would generally build the code and push the artifact to Nexus. But here in this case, because we already have a .tar.gz file. I am going to upload the artifact to Nexus directly. 

Create a Username and Password, login with the Username. After the Nexus Docker container is started. Create a repository named "mediawiki". 

Go the Source Directory and then run the below command

```
curl -v -u Username:Password --upload-file mediawiki-1.31.1.tar.gz http://dockerregistry.venky.corp:8081/repository/mediawiki/
```
