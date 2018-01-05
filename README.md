# SonarQube Scanner Docker Container

This Dockerfile can be used to build a Docker image that contains the SonarQube Scanner command line tool.

To build the image, use the following command:

    docker build . -t sonar-scanner

When you run the container with no command, e.g. (```docker run --rm -it sonar-scanner:latest```) it simply prints its configuration.

You can run the analysis with the folloing docker command:

    docker run -d --rm -v /Users/nhuber/repos/rx.core.clearing.presellers:$WORKDIR -w=$WORKDIR sonar-scanner:latest sonar-scanner

Make sure you map the volume as working directory that contains the `sonar-project.properties` file. This is picked up by the sonar-scanner.

To override the version, you can apoend `-Dsonar.projectVersion=$VERSION` to above command.