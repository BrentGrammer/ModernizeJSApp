FROM ortussolutions/commandbox:lucee5

# Set the Java agent options
# Set the JAVA_OPTS environment variable to include the Java agent
# ENV JAVA_OPTS="-javaagent:/opt/luceedebug/luceedebug.jar=jdwpHost=0.0.0.0,jdwpPort=10000"


# Copy the luceedebug.jar into the container
# COPY ./luceedebug-2.0.14.jar /opt/luceedebug/luceedebug.jar
# ENV JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:9999 -javaagent:/opt/luceedebug/luceedebug.jar=jdwpHost=localhost,jdwpPort=9999,debugHost=0.0.0.0,debugPort=10000,jarPath=/opt/luceedebug/luceedebug.jar"


COPY . /app

WORKDIR /app  

EXPOSE 8080
# EXPOSE 10000

# CMD ["box", "server", "start", "--console"] # adding console seems to keep process in foreground
CMD ["box", "server", "start"]