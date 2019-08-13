minikube
========

This role sets up a minikube instance. Works with CentOS

Role Variables
--------------

  * **minikube\_dependencies** is a list of packages to install.

Ansible's [virt\_net](http://docs.ansible.com/ansible/virt_net_module.html) module requires `lxml` and `libvirt-python`.

Minikube requires `firewalld`, `libvirt` and `dnsmasq`.

The actual packages are distribution dependent. They are installed by using the [package](http://docs.ansible.com/ansible/package_module.html) module from Ansible.


  * **minikube\_install\_dir** is the installation directory of the `minikube`, `kubectl`, `docker-machine` and `docker-machine-driver-kvm`. Defaults to `/usr/local/bin`.

  * **minikube\_version** is the version of minikube to install. If you don't want the latest you can override this using any of the tags [here](https://github.com/kubernetes/minikube/releases).

  * **kubectl\_version** is the kubectl version to install. Defaults to `v1.15.2`. You can find the latest version [here](https://storage.googleapis.com/kubernetes-release/release/stable.txt).

  * **docker\_machine\_version** is the docker-machine version to install. Defaults to `v0.16.0`. You can find all versions [here](https://github.com/docker/machine/releases).

  * **docker_machine_kvm_driver_version** is the version of the KVM driver to install. Defaults to `v0.10.0`. You can find all versions [here](https://github.com/dhiltgen/docker-machine-kvm/releases).


Note
-------

Beware that if you change any version and the binary already exists in the installation directory, you'll have to remove it.

This is because this role does not download the binary everytime, it would be too costly when included in other roles.

Example Playbook
----------------

This role works with only the defaults so using it is trivial:

    - hosts: all
      roles:
        - venky.minikube

If you want to change the installation directory:

    - hosts: all
      roles:
        - { role: venky.minikube, minikube_install_dir: "/opt" }

I have run it using the below command
sudo ansible kubernetes.venky.corp -m include_role -a name="minikube-role" --ask-pass

The output is below
```
$ sudo ansible kubernetes.venky.corp -m include_role -a name="minikube-role" --ask-pass
[sudo] password for venky:
SSH password:
kubernetes.venky.corp | SUCCESS => {
    "changed": false,
    "include_args": {
        "name": "minikube-role"
    }
}
kubernetes.venky.corp | SUCCESS => {
    "changed": false,
    "include": "linux.yml",
    "include_args": {}
}
kubernetes.venky.corp | SUCCESS => {
    "changed": false,
    "msg": "All items completed",
    "results": [
        {
            "ansible_facts": {
                "discovered_interpreter_python": "/usr/bin/python"
            },
            "ansible_loop_var": "item",
            "changed": false,
            "changes": {
                "installed": [],
                "updated": []
            },
            "failed": false,
            "invocation": {
                "module_args": {
                    "allow_downgrade": false,
                    "autoremove": false,
                    "bugfix": false,
                    "conf_file": null,
                    "disable_excludes": null,
                    "disable_gpg_check": false,
                    "disable_plugin": [],
                    "disablerepo": [],
                    "download_dir": null,
                    "download_only": false,
                    "enable_plugin": [],
                    "enablerepo": [],
                    "exclude": [],
                    "install_repoquery": true,
                    "install_weak_deps": true,
                    "installroot": "/",
                    "list": null,
                    "lock_timeout": 0,
                    "name": [
                        "python-lxml"
                    ],
                    "releasever": null,
                    "security": false,
                    "skip_broken": false,
                    "state": "latest",
                    "update_cache": false,
                    "update_only": false,
                    "use_backend": "auto",
                    "validate_certs": true
                }
            },
            "item": "python-lxml",
            "msg": "",
            "rc": 0,
            "results": [
                "All packages providing python-lxml are up to date",
                ""
            ]
        },
        {
            "ansible_loop_var": "item",
            "changed": false,
            "changes": {
                "installed": [],
                "updated": []
            },
            "failed": false,
            "invocation": {
                "module_args": {
                    "allow_downgrade": false,
                    "autoremove": false,
                    "bugfix": false,
                    "conf_file": null,
                    "disable_excludes": null,
                    "disable_gpg_check": false,
                    "disable_plugin": [],
                    "disablerepo": [],
                    "download_dir": null,
                    "download_only": false,
                    "enable_plugin": [],
                    "enablerepo": [],
                    "exclude": [],
                    "install_repoquery": true,
                    "install_weak_deps": true,
                    "installroot": "/",
                    "list": null,
                    "lock_timeout": 0,
                    "name": [
                        "libvirt-python"
                    ],
                    "releasever": null,
                    "security": false,
                    "skip_broken": false,
                    "state": "latest",
                    "update_cache": false,
                    "update_only": false,
                    "use_backend": "auto",
                    "validate_certs": true
                }
            },
            "item": "libvirt-python",
            "msg": "",
            "rc": 0,
            "results": [
                "All packages providing libvirt-python are up to date",
                ""
            ]
        },
        {
            "ansible_loop_var": "item",
            "changed": false,
            "changes": {
                "installed": [],
                "updated": []
            },
            "failed": false,
            "invocation": {
                "module_args": {
                    "allow_downgrade": false,
                    "autoremove": false,
                    "bugfix": false,
                    "conf_file": null,
                    "disable_excludes": null,
                    "disable_gpg_check": false,
                    "disable_plugin": [],
                    "disablerepo": [],
                    "download_dir": null,
                    "download_only": false,
                    "enable_plugin": [],
                    "enablerepo": [],
                    "exclude": [],
                    "install_repoquery": true,
                    "install_weak_deps": true,
                    "installroot": "/",
                    "list": null,
                    "lock_timeout": 0,
                    "name": [
                        "firewalld"
                    ],
                    "releasever": null,
                    "security": false,
                    "skip_broken": false,
                    "state": "latest",
                    "update_cache": false,
                    "update_only": false,
                    "use_backend": "auto",
                    "validate_certs": true
                }
            },
            "item": "firewalld",
            "msg": "",
            "rc": 0,
            "results": [
                "All packages providing firewalld are up to date",
                ""
            ]
        },
        {
            "ansible_loop_var": "item",
            "changed": false,
            "changes": {
                "installed": [],
                "updated": []
            },
            "failed": false,
            "invocation": {
                "module_args": {
                    "allow_downgrade": false,
                    "autoremove": false,
                    "bugfix": false,
                    "conf_file": null,
                    "disable_excludes": null,
                    "disable_gpg_check": false,
                    "disable_plugin": [],
                    "disablerepo": [],
                    "download_dir": null,
                    "download_only": false,
                    "enable_plugin": [],
                    "enablerepo": [],
                    "exclude": [],
                    "install_repoquery": true,
                    "install_weak_deps": true,
                    "installroot": "/",
                    "list": null,
                    "lock_timeout": 0,
                    "name": [
                        "dnsmasq"
                    ],
                    "releasever": null,
                    "security": false,
                    "skip_broken": false,
                    "state": "latest",
                    "update_cache": false,
                    "update_only": false,
                    "use_backend": "auto",
                    "validate_certs": true
                }
            },
            "item": "dnsmasq",
            "msg": "",
            "rc": 0,
            "results": [
                "All packages providing dnsmasq are up to date",
                ""
            ]
        },
        {
            "ansible_loop_var": "item",
            "changed": false,
            "changes": {
                "installed": [],
                "updated": []
            },
            "failed": false,
            "invocation": {
                "module_args": {
                    "allow_downgrade": false,
                    "autoremove": false,
                    "bugfix": false,
                    "conf_file": null,
                    "disable_excludes": null,
                    "disable_gpg_check": false,
                    "disable_plugin": [],
                    "disablerepo": [],
                    "download_dir": null,
                    "download_only": false,
                    "enable_plugin": [],
                    "enablerepo": [],
                    "exclude": [],
                    "install_repoquery": true,
                    "install_weak_deps": true,
                    "installroot": "/",
                    "list": null,
                    "lock_timeout": 0,
                    "name": [
                        "libvirt"
                    ],
                    "releasever": null,
                    "security": false,
                    "skip_broken": false,
                    "state": "latest",
                    "update_cache": false,
                    "update_only": false,
                    "use_backend": "auto",
                    "validate_certs": true
                }
            },
            "item": "libvirt",
            "msg": "",
            "rc": 0,
            "results": [
                "All packages providing libvirt are up to date",
                ""
            ]
        }
    ]
}
kubernetes.venky.corp | CHANGED => {
    "changed": true,
    "msg": "All items completed",
    "results": [
        {
            "ansible_loop_var": "item",
            "changed": true,
            "enabled": true,
            "failed": false,
            "invocation": {
                "module_args": {
                    "daemon_reexec": false,
                    "daemon_reload": false,
                    "enabled": true,
                    "force": null,
                    "masked": null,
                    "name": "firewalld",
                    "no_block": false,
                    "scope": null,
                    "state": "restarted",
                    "user": null
                }
            },
            "item": "firewalld",
            "name": "firewalld",
            "state": "started",
            "status": {
                "ActiveEnterTimestamp": "Tue 2019-08-13 09:53:12 EDT",
                "ActiveEnterTimestampMonotonic": "8205269591",
                "ActiveExitTimestamp": "Tue 2019-08-13 09:53:11 EDT",
                "ActiveExitTimestampMonotonic": "8203988450",
                "ActiveState": "active",
                "After": "dbus.service polkit.service basic.target system.slice",
                "AllowIsolate": "no",
                "AmbientCapabilities": "0",
                "AssertResult": "yes",
                "AssertTimestamp": "Tue 2019-08-13 09:53:12 EDT",
                "AssertTimestampMonotonic": "8204809446",
                "Before": "multi-user.target network-pre.target shutdown.target",
                "BlockIOAccounting": "no",
                "BlockIOWeight": "18446744073709551615",
                "BusName": "org.fedoraproject.FirewallD1",
                "CPUAccounting": "no",
                "CPUQuotaPerSecUSec": "infinity",
                "CPUSchedulingPolicy": "0",
                "CPUSchedulingPriority": "0",
                "CPUSchedulingResetOnFork": "no",
                "CPUShares": "18446744073709551615",
                "CanIsolate": "no",
                "CanReload": "yes",
                "CanStart": "yes",
                "CanStop": "yes",
                "CapabilityBoundingSet": "18446744073709551615",
                "ConditionResult": "yes",
                "ConditionTimestamp": "Tue 2019-08-13 09:53:12 EDT",
                "ConditionTimestampMonotonic": "8204809446",
                "Conflicts": "shutdown.target ebtables.service ip6tables.service ipset.service iptables.service",
                "ControlGroup": "/system.slice/firewalld.service",
                "ControlPID": "0",
                "DefaultDependencies": "yes",
                "Delegate": "no",
                "Description": "firewalld - dynamic firewall daemon",
                "DevicePolicy": "auto",
                "Documentation": "man:firewalld(1)",
                "EnvironmentFile": "/etc/sysconfig/firewalld (ignore_errors=yes)",
                "ExecMainCode": "0",
                "ExecMainExitTimestampMonotonic": "0",
                "ExecMainPID": "30846",
                "ExecMainStartTimestamp": "Tue 2019-08-13 09:53:12 EDT",
                "ExecMainStartTimestampMonotonic": "8204810914",
                "ExecMainStatus": "0",
                "ExecReload": "{ path=/bin/kill ; argv[]=/bin/kill -HUP $MAINPID ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
                "ExecStart": "{ path=/usr/sbin/firewalld ; argv[]=/usr/sbin/firewalld --nofork --nopid $FIREWALLD_ARGS ; ignore_errors=no ; start_time=[Tue 2019-08-13 09:53:12 EDT] ; stop_time=[n/a] ; pid=30846 ; code=(null) ; status=0/0 }",
                "FailureAction": "none",
                "FileDescriptorStoreMax": "0",
                "FragmentPath": "/usr/lib/systemd/system/firewalld.service",
                "GuessMainPID": "yes",
                "IOScheduling": "0",
                "Id": "firewalld.service",
                "IgnoreOnIsolate": "no",
                "IgnoreOnSnapshot": "no",
                "IgnoreSIGPIPE": "yes",
                "InactiveEnterTimestamp": "Tue 2019-08-13 09:53:12 EDT",
                "InactiveEnterTimestampMonotonic": "8204808202",
                "InactiveExitTimestamp": "Tue 2019-08-13 09:53:12 EDT",
                "InactiveExitTimestampMonotonic": "8204811483",
                "JobTimeoutAction": "none",
                "JobTimeoutUSec": "0",
                "KillMode": "mixed",
                "KillSignal": "15",
                "LimitAS": "18446744073709551615",
                "LimitCORE": "18446744073709551615",
                "LimitCPU": "18446744073709551615",
                "LimitDATA": "18446744073709551615",
                "LimitFSIZE": "18446744073709551615",
                "LimitLOCKS": "18446744073709551615",
                "LimitMEMLOCK": "65536",
                "LimitMSGQUEUE": "819200",
                "LimitNICE": "0",
                "LimitNOFILE": "4096",
                "LimitNPROC": "3845",
                "LimitRSS": "18446744073709551615",
                "LimitRTPRIO": "0",
                "LimitRTTIME": "18446744073709551615",
                "LimitSIGPENDING": "3845",
                "LimitSTACK": "18446744073709551615",
                "LoadState": "loaded",
                "MainPID": "30846",
                "MemoryAccounting": "no",
                "MemoryCurrent": "18446744073709551615",
                "MemoryLimit": "18446744073709551615",
                "MountFlags": "0",
                "Names": "firewalld.service",
                "NeedDaemonReload": "no",
                "Nice": "0",
                "NoNewPrivileges": "no",
                "NonBlocking": "no",
                "NotifyAccess": "none",
                "OOMScoreAdjust": "0",
                "OnFailureJobMode": "replace",
                "PermissionsStartOnly": "no",
                "PrivateDevices": "no",
                "PrivateNetwork": "no",
                "PrivateTmp": "no",
                "ProtectHome": "no",
                "ProtectSystem": "no",
                "RefuseManualStart": "no",
                "RefuseManualStop": "no",
                "RemainAfterExit": "no",
                "Requires": "basic.target",
                "Restart": "no",
                "RestartUSec": "100ms",
                "Result": "success",
                "RootDirectoryStartOnly": "no",
                "RuntimeDirectoryMode": "0755",
                "SameProcessGroup": "no",
                "SecureBits": "0",
                "SendSIGHUP": "no",
                "SendSIGKILL": "yes",
                "Slice": "system.slice",
                "StandardError": "null",
                "StandardInput": "null",
                "StandardOutput": "null",
                "StartLimitAction": "none",
                "StartLimitBurst": "5",
                "StartLimitInterval": "10000000",
                "StartupBlockIOWeight": "18446744073709551615",
                "StartupCPUShares": "18446744073709551615",
                "StatusErrno": "0",
                "StopWhenUnneeded": "no",
                "SubState": "running",
                "SyslogLevelPrefix": "yes",
                "SyslogPriority": "30",
                "SystemCallErrorNumber": "0",
                "TTYReset": "no",
                "TTYVHangup": "no",
                "TTYVTDisallocate": "no",
                "TasksAccounting": "no",
                "TasksCurrent": "2",
                "TasksMax": "18446744073709551615",
                "TimeoutStartUSec": "1min 30s",
                "TimeoutStopUSec": "1min 30s",
                "TimerSlackNSec": "50000",
                "Transient": "no",
                "Type": "dbus",
                "UMask": "0022",
                "UnitFilePreset": "enabled",
                "UnitFileState": "enabled",
                "WantedBy": "multi-user.target",
                "Wants": "network-pre.target system.slice",
                "WatchdogTimestamp": "Tue 2019-08-13 09:53:12 EDT",
                "WatchdogTimestampMonotonic": "8205269532",
                "WatchdogUSec": "0"
            }
        },
        {
            "ansible_loop_var": "item",
            "changed": true,
            "enabled": true,
            "failed": false,
            "invocation": {
                "module_args": {
                    "daemon_reexec": false,
                    "daemon_reload": false,
                    "enabled": true,
                    "force": null,
                    "masked": null,
                    "name": "libvirtd",
                    "no_block": false,
                    "scope": null,
                    "state": "restarted",
                    "user": null
                }
            },
            "item": "libvirtd",
            "name": "libvirtd",
            "state": "started",
            "status": {
                "ActiveEnterTimestamp": "Tue 2019-08-13 09:53:25 EDT",
                "ActiveEnterTimestampMonotonic": "8217589737",
                "ActiveExitTimestamp": "Tue 2019-08-13 09:53:19 EDT",
                "ActiveExitTimestampMonotonic": "8212099819",
                "ActiveState": "active",
                "After": "systemd-logind.service system.slice local-fs.target iscsid.service virtlockd.socket systemd-journald.socket virtlockd-admin.socket apparmor.service dbus.service basic.target virtlogd.socket virtlogd-admin.socket virtlogd.service virtlockd.service systemd-machined.service remote-fs.target network.target",
                "AllowIsolate": "no",
                "AmbientCapabilities": "0",
                "AssertResult": "yes",
                "AssertTimestamp": "Tue 2019-08-13 09:53:19 EDT",
                "AssertTimestampMonotonic": "8212205463",
                "Before": "multi-user.target libvirt-guests.service shutdown.target",
                "BlockIOAccounting": "no",
                "BlockIOWeight": "18446744073709551615",
                "CPUAccounting": "no",
                "CPUQuotaPerSecUSec": "infinity",
                "CPUSchedulingPolicy": "0",
                "CPUSchedulingPriority": "0",
                "CPUSchedulingResetOnFork": "no",
                "CPUShares": "18446744073709551615",
                "CanIsolate": "no",
                "CanReload": "yes",
                "CanStart": "yes",
                "CanStop": "yes",
                "CapabilityBoundingSet": "18446744073709551615",
                "ConditionResult": "yes",
                "ConditionTimestamp": "Tue 2019-08-13 09:53:19 EDT",
                "ConditionTimestampMonotonic": "8212205463",
                "Conflicts": "shutdown.target",
                "ControlGroup": "/system.slice/libvirtd.service",
                "ControlPID": "0",
                "DefaultDependencies": "yes",
                "Delegate": "no",
                "Description": "Virtualization daemon",
                "DevicePolicy": "auto",
                "Documentation": "man:libvirtd(8) https://libvirt.org",
                "EnvironmentFile": "/etc/sysconfig/libvirtd (ignore_errors=yes)",
                "ExecMainCode": "0",
                "ExecMainExitTimestampMonotonic": "0",
                "ExecMainPID": "31244",
                "ExecMainStartTimestamp": "Tue 2019-08-13 09:53:19 EDT",
                "ExecMainStartTimestampMonotonic": "8212206205",
                "ExecMainStatus": "0",
                "ExecReload": "{ path=/bin/kill ; argv[]=/bin/kill -HUP $MAINPID ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
                "ExecStart": "{ path=/usr/sbin/libvirtd ; argv[]=/usr/sbin/libvirtd $LIBVIRTD_ARGS ; ignore_errors=no ; start_time=[Tue 2019-08-13 09:53:19 EDT] ; stop_time=[n/a] ; pid=31244 ; code=(null) ; status=0/0 }",
                "FailureAction": "none",
                "FileDescriptorStoreMax": "0",
                "FragmentPath": "/usr/lib/systemd/system/libvirtd.service",
                "GuessMainPID": "yes",
                "IOScheduling": "0",
                "Id": "libvirtd.service",
                "IgnoreOnIsolate": "no",
                "IgnoreOnSnapshot": "no",
                "IgnoreSIGPIPE": "yes",
                "InactiveEnterTimestamp": "Tue 2019-08-13 09:53:19 EDT",
                "InactiveEnterTimestampMonotonic": "8212126906",
                "InactiveExitTimestamp": "Tue 2019-08-13 09:53:19 EDT",
                "InactiveExitTimestampMonotonic": "8212207317",
                "JobTimeoutAction": "none",
                "JobTimeoutUSec": "0",
                "KillMode": "process",
                "KillSignal": "15",
                "LimitAS": "18446744073709551615",
                "LimitCORE": "18446744073709551615",
                "LimitCPU": "18446744073709551615",
                "LimitDATA": "18446744073709551615",
                "LimitFSIZE": "18446744073709551615",
                "LimitLOCKS": "18446744073709551615",
                "LimitMEMLOCK": "65536",
                "LimitMSGQUEUE": "819200",
                "LimitNICE": "0",
                "LimitNOFILE": "8192",
                "LimitNPROC": "3845",
                "LimitRSS": "18446744073709551615",
                "LimitRTPRIO": "0",
                "LimitRTTIME": "18446744073709551615",
                "LimitSIGPENDING": "3845",
                "LimitSTACK": "18446744073709551615",
                "LoadState": "loaded",
                "MainPID": "31244",
                "MemoryAccounting": "no",
                "MemoryCurrent": "18446744073709551615",
                "MemoryLimit": "18446744073709551615",
                "MountFlags": "0",
                "Names": "libvirtd.service",
                "NeedDaemonReload": "no",
                "Nice": "0",
                "NoNewPrivileges": "no",
                "NonBlocking": "no",
                "NotifyAccess": "main",
                "OOMScoreAdjust": "0",
                "OnFailureJobMode": "replace",
                "PermissionsStartOnly": "no",
                "PrivateDevices": "no",
                "PrivateNetwork": "no",
                "PrivateTmp": "no",
                "ProtectHome": "no",
                "ProtectSystem": "no",
                "RefuseManualStart": "no",
                "RefuseManualStop": "no",
                "RemainAfterExit": "no",
                "Requires": "virtlogd.socket virtlockd.socket basic.target",
                "Restart": "on-failure",
                "RestartUSec": "100ms",
                "Result": "success",
                "RootDirectoryStartOnly": "no",
                "RuntimeDirectoryMode": "0755",
                "SameProcessGroup": "no",
                "SecureBits": "0",
                "SendSIGHUP": "no",
                "SendSIGKILL": "yes",
                "Slice": "system.slice",
                "StandardError": "inherit",
                "StandardInput": "null",
                "StandardOutput": "journal",
                "StartLimitAction": "none",
                "StartLimitBurst": "5",
                "StartLimitInterval": "10000000",
                "StartupBlockIOWeight": "18446744073709551615",
                "StartupCPUShares": "18446744073709551615",
                "StatusErrno": "0",
                "StopWhenUnneeded": "no",
                "SubState": "running",
                "SyslogLevelPrefix": "yes",
                "SyslogPriority": "30",
                "SystemCallErrorNumber": "0",
                "TTYReset": "no",
                "TTYVHangup": "no",
                "TTYVTDisallocate": "no",
                "TasksAccounting": "no",
                "TasksCurrent": "19",
                "TasksMax": "32768",
                "TimeoutStartUSec": "1min 30s",
                "TimeoutStopUSec": "1min 30s",
                "TimerSlackNSec": "50000",
                "Transient": "no",
                "Type": "notify",
                "UMask": "0022",
                "UnitFilePreset": "enabled",
                "UnitFileState": "enabled",
                "WantedBy": "multi-user.target libvirt-guests.service",
                "Wants": "systemd-machined.service system.slice",
                "WatchdogTimestamp": "Tue 2019-08-13 09:53:25 EDT",
                "WatchdogTimestampMonotonic": "8217589211",
                "WatchdogUSec": "0"
            }
        }
    ]
}
kubernetes.venky.corp | SUCCESS => {
    "changed": false
}
kubernetes.venky.corp | SUCCESS => {
    "changed": false
}
kubernetes.venky.corp | CHANGED => {
    "changed": true,
    "msg": "All items completed",
    "results": [
        {
            "ansible_loop_var": "item",
            "changed": true,
            "checksum_dest": null,
            "checksum_src": "213cda36fb2496a3a7aa578c713eb835ccde8069",
            "dest": "/usr/local/bin/minikube",
            "elapsed": 42,
            "failed": false,
            "gid": 0,
            "group": "root",
            "invocation": {
                "module_args": {
                    "attributes": null,
                    "backup": null,
                    "checksum": "",
                    "client_cert": null,
                    "client_key": null,
                    "content": null,
                    "delimiter": null,
                    "dest": "/usr/local/bin/minikube",
                    "directory_mode": null,
                    "follow": false,
                    "force": false,
                    "force_basic_auth": false,
                    "group": null,
                    "headers": null,
                    "http_agent": "ansible-httpget",
                    "mode": null,
                    "owner": null,
                    "path": "/usr/local/bin/minikube",
                    "regexp": null,
                    "remote_src": null,
                    "selevel": null,
                    "serole": null,
                    "setype": null,
                    "seuser": null,
                    "sha256sum": "",
                    "src": null,
                    "timeout": 10,
                    "tmp_dest": null,
                    "unsafe_writes": null,
                    "url": "https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64",
                    "url_password": null,
                    "url_username": null,
                    "use_proxy": true,
                    "validate_certs": true
                }
            },
            "item": {
                "dest": "/usr/local/bin/minikube",
                "url": "https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64"
            },
            "md5sum": "05446637e768d7287313e60173e35136",
            "mode": "0644",
            "msg": "OK (55869264 bytes)",
            "owner": "root",
            "secontext": "system_u:object_r:bin_t:s0",
            "size": 55869264,
            "src": "/root/.ansible/tmp/ansible-tmp-1565707409.17-45140718366329/tmpZlns_6",
            "state": "file",
            "status_code": 200,
            "uid": 0,
            "url": "https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64"
        },
        {
            "ansible_loop_var": "item",
            "changed": true,
            "checksum_dest": null,
            "checksum_src": "9f3142c4ea2e2ad168dc9cdce8db035f2315315d",
            "dest": "/usr/local/bin/kubectl",
            "elapsed": 80,
            "failed": false,
            "gid": 0,
            "group": "root",
            "invocation": {
                "module_args": {
                    "attributes": null,
                    "backup": null,
                    "checksum": "",
                    "client_cert": null,
                    "client_key": null,
                    "content": null,
                    "delimiter": null,
                    "dest": "/usr/local/bin/kubectl",
                    "directory_mode": null,
                    "follow": false,
                    "force": false,
                    "force_basic_auth": false,
                    "group": null,
                    "headers": null,
                    "http_agent": "ansible-httpget",
                    "mode": null,
                    "owner": null,
                    "path": "/usr/local/bin/kubectl",
                    "regexp": null,
                    "remote_src": null,
                    "selevel": null,
                    "serole": null,
                    "setype": null,
                    "seuser": null,
                    "sha256sum": "",
                    "src": null,
                    "timeout": 10,
                    "tmp_dest": null,
                    "unsafe_writes": null,
                    "url": "https://storage.googleapis.com/kubernetes-release/release/v1.15.2/bin/linux/amd64/kubectl",
                    "url_password": null,
                    "url_username": null,
                    "use_proxy": true,
                    "validate_certs": true
                }
            },
            "item": {
                "dest": "/usr/local/bin/kubectl",
                "url": "https://storage.googleapis.com/kubernetes-release/release/v1.15.2/bin/linux/amd64/kubectl"
            },
            "md5sum": "daf020f5dc07314f4e388e4a6c9cc201",
            "mode": "0644",
            "msg": "OK (42985504 bytes)",
            "owner": "root",
            "secontext": "system_u:object_r:bin_t:s0",
            "size": 42985504,
            "src": "/root/.ansible/tmp/ansible-tmp-1565707452.78-142025752605439/tmpOnTppV",
            "state": "file",
            "status_code": 200,
            "uid": 0,
            "url": "https://storage.googleapis.com/kubernetes-release/release/v1.15.2/bin/linux/amd64/kubectl"
        },
        {
            "ansible_loop_var": "item",
            "changed": true,
            "checksum_dest": null,
            "checksum_src": "81be92a6b4633fd5206693933f3358c43a1188e3",
            "dest": "/usr/local/bin/docker-machine",
            "elapsed": 34,
            "failed": false,
            "gid": 0,
            "group": "root",
            "invocation": {
                "module_args": {
                    "attributes": null,
                    "backup": null,
                    "checksum": "",
                    "client_cert": null,
                    "client_key": null,
                    "content": null,
                    "delimiter": null,
                    "dest": "/usr/local/bin/docker-machine",
                    "directory_mode": null,
                    "follow": false,
                    "force": false,
                    "force_basic_auth": false,
                    "group": null,
                    "headers": null,
                    "http_agent": "ansible-httpget",
                    "mode": null,
                    "owner": null,
                    "path": "/usr/local/bin/docker-machine",
                    "regexp": null,
                    "remote_src": null,
                    "selevel": null,
                    "serole": null,
                    "setype": null,
                    "seuser": null,
                    "sha256sum": "",
                    "src": null,
                    "timeout": 10,
                    "tmp_dest": null,
                    "unsafe_writes": null,
                    "url": "https://github.com/docker/machine/releases/download/v0.16.0/docker-machine-Linux-x86_64",
                    "url_password": null,
                    "url_username": null,
                    "use_proxy": true,
                    "validate_certs": true
                }
            },
            "item": {
                "dest": "/usr/local/bin/docker-machine",
                "url": "https://github.com/docker/machine/releases/download/v0.16.0/docker-machine-Linux-x86_64"
            },
            "md5sum": "9651afe8883dbcb3b2f48c630a847082",
            "mode": "0644",
            "msg": "OK (28164576 bytes)",
            "owner": "root",
            "secontext": "system_u:object_r:bin_t:s0",
            "size": 28164576,
            "src": "/root/.ansible/tmp/ansible-tmp-1565707534.08-262493981707389/tmpmCAOYS",
            "state": "file",
            "status_code": 200,
            "uid": 0,
            "url": "https://github.com/docker/machine/releases/download/v0.16.0/docker-machine-Linux-x86_64"
        }
    ]
}
kubernetes.venky.corp | CHANGED => {
    "changed": true,
    "msg": "All items completed",
    "results": [
        {
            "ansible_loop_var": "item",
            "changed": true,
            "diff": {
                "after": {
                    "mode": "0755",
                    "path": "/usr/local/bin/minikube"
                },
                "before": {
                    "mode": "0644",
                    "path": "/usr/local/bin/minikube"
                }
            },
            "failed": false,
            "gid": 0,
            "group": "root",
            "invocation": {
                "module_args": {
                    "_diff_peek": null,
                    "_original_basename": null,
                    "access_time": null,
                    "access_time_format": "%Y%m%d%H%M.%S",
                    "attributes": null,
                    "backup": null,
                    "content": null,
                    "delimiter": null,
                    "dest": "/usr/local/bin/minikube",
                    "directory_mode": null,
                    "follow": true,
                    "force": false,
                    "group": null,
                    "mode": "0755",
                    "modification_time": null,
                    "modification_time_format": "%Y%m%d%H%M.%S",
                    "owner": null,
                    "path": "/usr/local/bin/minikube",
                    "recurse": false,
                    "regexp": null,
                    "remote_src": null,
                    "selevel": null,
                    "serole": null,
                    "setype": null,
                    "seuser": null,
                    "src": null,
                    "state": "file",
                    "unsafe_writes": null
                }
            },
            "item": "minikube",
            "mode": "0755",
            "owner": "root",
            "path": "/usr/local/bin/minikube",
            "secontext": "system_u:object_r:bin_t:s0",
            "size": 55869264,
            "state": "file",
            "uid": 0
        },
        {
            "ansible_loop_var": "item",
            "changed": true,
            "diff": {
                "after": {
                    "mode": "0755",
                    "path": "/usr/local/bin/kubectl"
                },
                "before": {
                    "mode": "0644",
                    "path": "/usr/local/bin/kubectl"
                }
            },
            "failed": false,
            "gid": 0,
            "group": "root",
            "invocation": {
                "module_args": {
                    "_diff_peek": null,
                    "_original_basename": null,
                    "access_time": null,
                    "access_time_format": "%Y%m%d%H%M.%S",
                    "attributes": null,
                    "backup": null,
                    "content": null,
                    "delimiter": null,
                    "dest": "/usr/local/bin/kubectl",
                    "directory_mode": null,
                    "follow": true,
                    "force": false,
                    "group": null,
                    "mode": "0755",
                    "modification_time": null,
                    "modification_time_format": "%Y%m%d%H%M.%S",
                    "owner": null,
                    "path": "/usr/local/bin/kubectl",
                    "recurse": false,
                    "regexp": null,
                    "remote_src": null,
                    "selevel": null,
                    "serole": null,
                    "setype": null,
                    "seuser": null,
                    "src": null,
                    "state": "file",
                    "unsafe_writes": null
                }
            },
            "item": "kubectl",
            "mode": "0755",
            "owner": "root",
            "path": "/usr/local/bin/kubectl",
            "secontext": "system_u:object_r:bin_t:s0",
            "size": 42985504,
            "state": "file",
            "uid": 0
        },
        {
            "ansible_loop_var": "item",
            "changed": true,
            "diff": {
                "after": {
                    "mode": "0755",
                    "path": "/usr/local/bin/docker-machine"
                },
                "before": {
                    "mode": "0644",
                    "path": "/usr/local/bin/docker-machine"
                }
            },
            "failed": false,
            "gid": 0,
            "group": "root",
            "invocation": {
                "module_args": {
                    "_diff_peek": null,
                    "_original_basename": null,
                    "access_time": null,
                    "access_time_format": "%Y%m%d%H%M.%S",
                    "attributes": null,
                    "backup": null,
                    "content": null,
                    "delimiter": null,
                    "dest": "/usr/local/bin/docker-machine",
                    "directory_mode": null,
                    "follow": true,
                    "force": false,
                    "group": null,
                    "mode": "0755",
                    "modification_time": null,
                    "modification_time_format": "%Y%m%d%H%M.%S",
                    "owner": null,
                    "path": "/usr/local/bin/docker-machine",
                    "recurse": false,
                    "regexp": null,
                    "remote_src": null,
                    "selevel": null,
                    "serole": null,
                    "setype": null,
                    "seuser": null,
                    "src": null,
                    "state": "file",
                    "unsafe_writes": null
                }
            },
            "item": "docker-machine",
            "mode": "0755",
            "owner": "root",
            "path": "/usr/local/bin/docker-machine",
            "secontext": "system_u:object_r:bin_t:s0",
            "size": 28164576,
            "state": "file",
            "uid": 0
        }
    ]
}
	
```
