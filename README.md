# Sonar-Scanner Docker Image

This Docker image contains the SonarQube Scanner command line interface. You can use it to perform static code analysis with SonarQube. 

## Perform an analysis job

To start an analysis job, run the container from your directory containing the `sonar-project.properties` configuration file:

    docker run --rm --mount type=bind,source="$(pwd)",target=/project-root -w=/project-root sonar-scanner:latest sonar-scanner

This command maps the working directory on the host to the work directory inside the container. With `-w` we switch to the mapped work directory. 
Make sure you map the directory containing the `sonar-project.properties` file so the sonar scanner can pick it up.

## Further customization

You can override the configuratio of the sonar-scanner. For example, to override the version, you can append `-Dsonar.projectVersion=$VERSION` to the command above.

## Print configuration information

To print the project configuration information, run the container without starting an analysis job with `docker run --rm -it sonar-scanner:latest` (omit the command `sonar-scanner` at the end).
