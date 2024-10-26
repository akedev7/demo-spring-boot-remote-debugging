# Spring Boot Application with Remote Debugging in Docker

This repository contains a Spring Boot application packaged as a WAR file, configured to run on Tomcat in a Docker container with remote debugging enabled.

## Prerequisites

- Docker installed on your machine.
- IntelliJ IDEA (or another Java IDE that supports remote debugging).

## Building the Docker Image

1. Clone this repository:

   ```bash
   git clone <repository-url>
   cd <repository-directory>
    ```

2. Build the Docker image:

docker build -t my-spring-boot-debug-app .

## Run docker container
Run the Docker container with the following command:

docker run -p 8080:8080 -p 8000:8000 my-spring-boot-debug-app

- 8080: The port for accessing the Spring Boot application.
- 8000: The port for remote debugging.

Once the container is running, you can access the application in your web browser at:

http://localhost:8080/test?value=123

## Connect Intellij to running Docker instance

Setting Up Remote Debugging in IntelliJ IDEA
1. Open IntelliJ IDEA and go to Run > Edit Configurations.

2. Click the + icon and select Remote JVM Debug.

3. In the configuration settings, set the following:

Name: Give your configuration a name (e.g., Remote Debug).
Host: Set to localhost.
Port: Set to 8000.
(Example image; please adjust based on your IDE version)

4. Click OK to save the configuration.

5. Place breakpoints in your code where you want the execution to pause.

6. Start the remote debug configuration by selecting it from the Run configurations dropdown and clicking the Debug button (or press Shift + F9).