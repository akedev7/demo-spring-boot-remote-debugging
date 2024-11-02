# Spring Boot Application with Remote Debugging and Remote profiling in Docker

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
```bash
docker build -t my-spring-boot-debug-app .
```

## Run docker container
Run the Docker container with the following command:

```bash
docker run -p 8080:8080 -p 8000:8000 -p 9090:9090 my-spring-boot-debug-app
```

- 8080: The port for accessing the Spring Boot application.
- 8000: The port for remote debugging.
- 9090: The port for remote profiling with VisualVM

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




## VisualVM Remote Connection Guide

This guide describes how to use VisualVM to connect to a Java application running on localhost at port 9090.

1. Launch VisualVM.
2. In the Applications window, right-click on Local or Remote and select Add JMX Connection.
3. Enter the connection URL as follows:
```
localhost:9090
```
4. Click OK to confirm.


## JDK Mission Control (JMC) Connection Guide
This guide explains how to connect to a Java application running on localhost and listening on port 9090 using JDK Mission Control (JMC).

1. Open JDK Mission Control.
2. Go to the File menu, then select Connect.
3. In the JMX Connections window, click Create a new connection.
4. In the Create a new connection dialog:
   - Host: Enter localhost.
   - Port: Enter 9090.
5. Click Finish to create the connection.
6. Once the connection is established, you can use Flight Recorder in JMC to start detailed recordings of your application’s performance (e.g., CPU and memory usage).
   - To capture CPU time on each method calls accurately, you can set **Thread dump** to **Every 1s**. 