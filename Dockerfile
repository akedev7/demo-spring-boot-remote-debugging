# Use an official Tomcat base image
FROM tomcat:latest

# Set environment variables for Tomcat
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Enable JPDA debugging with default port 8000
ENV JPDA_ADDRESS=*:8000
ENV JPDA_TRANSPORT=dt_socket

# Copy the WAR file from the target directory to the webapps directory of Tomcat
COPY build/libs/ROOT.war $CATALINA_HOME/webapps/

# Expose port 8080 for HTTP and port 8000 for remote debugging
EXPOSE 8080 8000

# Start Tomcat in JPDA (Java Platform Debugger Architecture) mode for debugging
CMD ["catalina.sh", "jpda", "run"]