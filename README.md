# SonarQube Scanner Docker Container

This Dockerfile can be used to build a Docker image that contains the SonarQube Scanner command line tool.

To build the image, use the following command:
```docker build . -t sonar-scanner```

When you run the container, don't forget to pass a configuration file to the scanner as well as to mount the source code into the container.