WildFly 10.0.0.Final on Java 8
==============================

This is a Docker image for the Java application server [WildFly](http://wildfly.org/). The image is based on Ubuntu 15.10 and comes with Java 8. The Dockerfile has been inspired by [this image](https://registry.hub.docker.com/u/sillenttroll/wildfly-java-8/).

Tags
----

* `10.0.0.Final` ([Dockerfile](https://github.com/JensPiegsa/WildFly/blob/10.0.0.Final/Dockerfile)), `latest-final` , `latest`
* `10.0.0.CR5` ([Dockerfile](https://github.com/JensPiegsa/WildFly/blob/10.0.0.CR5/Dockerfile))
* `10.0.0.CR4` ([Dockerfile](https://github.com/JensPiegsa/WildFly/blob/10.0.0.CR4/Dockerfile))
* `10.0.0.CR2` ([Dockerfile](https://github.com/JensPiegsa/WildFly/blob/10.0.0.CR2/Dockerfile))
* `10.0.0.CR1` ([Dockerfile](https://github.com/JensPiegsa/WildFly/blob/10.0.0.CR1/Dockerfile))
* `10.0.0.Beta2` ([Dockerfile](https://github.com/JensPiegsa/WildFly/blob/10.0.0.Beta2/Dockerfile)),
* `10.0.0.Beta1` ([Dockerfile](https://github.com/JensPiegsa/WildFly/blob/10.0.0.Beta1/Dockerfile))
* `9.0.1.Final` ([Dockerfile](https://github.com/JensPiegsa/WildFly/blob/9.0.1.Final/Dockerfile))
* `9.0.0.Final` ([Dockerfile](https://github.com/JensPiegsa/WildFly/blob/9.0.0.Final/Dockerfile))
* `9.0.0.CR2` ([Dockerfile](https://github.com/JensPiegsa/WildFly/blob/9.0.0.CR2/Dockerfile))
* `9.0.0.CR1` ([Dockerfile](https://github.com/JensPiegsa/WildFly/blob/9.0.0.CR1/Dockerfile))
* `9.0.0.Beta2` ([Dockerfile](https://github.com/JensPiegsa/WildFly/blob/9.0.0.Beta2/Dockerfile))
* `8.2` ([Dockerfile](https://github.com/JensPiegsa/WildFly/blob/8.2.0.Final/Dockerfile))

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

* follow  the server log: `docker logs -f wf`
* stop and remove the Docker container: `docker stop wf && docker rm wf`
* access the shell: `docker exec -it wf /bin/bash`
* access CLI: `docker exec -it wf /opt/wildfly/bin/jboss-cli.sh -c -u=admin -p=a_password`

Contribute
----------

The source is available on [Github](https://github.com/JensPiegsa/WildFly/). Please [report any issues](https://github.com/JensPiegsa/WildFly/issues).
