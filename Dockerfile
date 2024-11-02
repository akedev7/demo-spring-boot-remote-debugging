# Use an official Tomcat base image
FROM tomcat:jre21-temurin

# Set environment variables for Tomcat
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Enable JPDA debugging with default port 8000
ENV JPDA_ADDRESS=*:8000
ENV JPDA_TRANSPORT=dt_socket

# Enable JMX for remote profiling with VisualVM
ENV CATALINA_OPTS="-Dcom.sun.management.jmxremote \
    -Dcom.sun.management.jmxremote.port=9090 \
    -Dcom.sun.management.jmxremote.rmi.port=9090 \
    -Dcom.sun.management.jmxremote.authenticate=false \
    -Dcom.sun.management.jmxremote.ssl=false \
    -Djava.rmi.server.hostname=127.0.0.1 \
    -Dcom.sun.management.jmxremote.local.only=false"

# Copy the WAR file from the target directory to the webapps directory of Tomcat
COPY build/libs/ROOT.war $CATALINA_HOME/webapps/

# Expose port 8080 for HTTP and port 8000 for remote debugging, and 9090 for remote profiling
EXPOSE 8080 8000 9090

# Start Tomcat in JPDA (Java Platform Debugger Architecture) mode for debugging
CMD ["catalina.sh", "jpda", "run"]