###To setup the Jenkins Job for deployment

> Install Kubectl on Jenkins host

> Create a Jenkins Job with the execute shell script given here MediaWiki_Deploy.sh or run it directly by connecting to the Github repository using (sh MediaWiki_Deploy.sh) in the "Shell Command"

> Update the .kube/config file as below
```
apiVersion: v1
clusters:
- cluster:
    insecure-skip-tls-verify: true
    server: https://192.168.99.101:8443
  name: minikube
contexts:
- context:
    cluster: minikube
    user: minikube
  name: minikube
current-context: minikube
kind: Config
preferences: {}
users:
- name: minikube
  user:
    client-certificate: /tmp/client.crt
    client-key: /tmp/client.key
```

> Copy the client.crt and client.key from .minikube on the minikube host to the required path on the Jenkins host

> Now that the kubectl is setup, run the Jenkins job with the script MediaWiki_Deploy.sh
