# SonarQube Scanner Docker Container

This Dockerfile can be used to build a Docker image that contains the SonarQube Scanner command line tool.

To build the image, use the following command:

    docker build . -t sonar-scanner

You can run the container without starting an analysis job with `docker run --rm -it sonar-scanner:latest`. This simply prints the  configuration.

To start an analysis, run the container like this:

    docker run -d --rm -v $HOSTWORKDIR:$WORKDIR -w=$WORKDIR sonar-scanner:latest sonar-scanner

This command maps a working directory on the host to a directory inside the container. With `-w` we switch to the mapped directory. 
Make sure you map the volume as working directory that contains the `sonar-project.properties` file. Then this configuration is picked up by the sonar-scanner.

Further customization: You can override the configuratio of the sonar-scanner. For example, to override the version, you can append `-Dsonar.projectVersion=$VERSION` to the command above.