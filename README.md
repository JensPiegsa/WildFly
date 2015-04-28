WildFly 8 / 9 on Java 8
=======================

This is a Docker image for the Java application server [WildFly](http://wildfly.org/). The image is based on Ubuntu 15.04 and comes with Java 8. The Dockerfile for this image has been inspired by [sillenttroll's image](https://registry.hub.docker.com/u/sillenttroll/wildfly-java-8/).

Tags
----

* 8.2
* 9.0.0.Beta2, latest

Features
--------

* runs in standalone mode
* binds to all interfaces
* creates an `admin` user on first usage
* installation path: `/opt/wildfly`
* linux user: `wildfly`

1. Install Docker
-----------------

Follow the [installation instructions](http://docs.docker.com/installation/) for your host system.

2. Run the image
----------------

```sh
docker run --name="wf" -d -p 8080:8080 -p 9990:9990 -e WILDFLY_PASS="a_password" piegsaj/wildfly
```

or

```sh
mkdir /opt/wildfly-deployments
chmod 777 /opt/wildfly-deployments
sudo docker run --name="wf" -d -p 8080:8080 -p 9990:9990 -e WILDFLY_PASS="a_password" -v /opt/wildfly-deployments:/opt/wildfly/standalone/deployments/:rw piegsaj/wildfly
```

3. Access WildFly
-----------------

* via `http://<host-ip>:8080/` and `http://<host-ip>:9990/`

Administration
--------------

* follow  the server log: `docker logs wf`
* stop and remove the Docker container: `docker stop wf && docker rm wf`
* access the shell: `docker exec -it wf /bin/bash`

Contribute
----------

The source is available on [Github](https://github.com/JensPiegsa/WildFly/). Please [report any issues](https://github.com/JensPiegsa/WildFly/issues).
