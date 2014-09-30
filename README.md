WildFly
=======

Install Docker
--------------

Follow the [installation instructions](http://docs.docker.com/installation/) for your host system.

Run the image
-------------

```sh
docker run --name="wf" -d -p 8080:8080 -p 9990:9990 -e WILDFLY_PASS="a_password" piegsaj/wildfly
```

Access WildFly
--------------

via `http://host-ip:8080/` and `http://host-ip:9990/`:

Contribute
----------

The source is available on [Github](https://github.com/JensPiegsa/WildFly/). Please [report any issues](https://github.com/JensPiegsa/WildFly/issues).
