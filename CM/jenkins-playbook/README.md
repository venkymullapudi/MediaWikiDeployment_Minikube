## Jenkins Playbook

Run the Jenkins Playbook using the below command, use the password given at the end of running the playbook in the browser and setup the Jenkins.


```
$ ansible-playbook -i jenkins.venky.corp, jenkins.yml -K
BECOME password:

PLAY [Install Jenkins] *************************************************************************************************

TASK [Install yum] *****************************************************************************************************
ok: [jenkins.venky.corp]

TASK [Download jenkins.repo] *******************************************************************************************
changed: [jenkins.venky.corp]

TASK [Import Jenkins Key] **********************************************************************************************
changed: [jenkins.venky.corp]

TASK [Install Jenkins] *************************************************************************************************
        changed: [jenkins.venky.corp]

TASK [Start & Enable Jenkins] ******************************************************************************************
changed: [jenkins.venky.corp]

TASK [Sleep for 30 seconds and continue with play] *********************************************************************
ok: [jenkins.venky.corp]

TASK [Get init password Jenkins] ***************************************************************************************
ok: [jenkins.venky.corp]

TASK [Print init password Jenkins] *************************************************************************************
ok: [jenkins.venky.corp] => {
    "result.stdout": "996aa7ea576d49018e3fdc2a2094b32e"
}

PLAY RECAP *************************************************************************************************************
jenkins.venky.corp         : ok=8    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```


