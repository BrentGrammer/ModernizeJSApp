# Debugger - Luceedebug

Adding Luceedebug to the application to enable line by line stepping and debugging in the Lucee CFML code.

- [luceedebug GitHub](https://github.com/softwareCobbler/luceedebug)
- [Installation Guide](https://docs.lucee.org/guides/Various/lucee-step-debugger-installation-guide.html)

## Prerequisites

- Docker Desktop

## Run the App

- `docker compose up`
- Go to http://localhost:8080

## Troubleshooting

- NOTE: The image you're using must have the JDK installed in it. For Commandbox images, using a jdk tagged image, `:jdk11` for example, includes it in the image.

### Debugger not attaching

- [Issues Tracker](https://github.com/softwareCobbler/luceedebug/issues/66)
- Some kind of ephemeral JVM was started causing issues - the solution is to move the JAVA_OPTS args out of docker compose (BOX_JAVA_ARGS) into server.json and specify the jdk version of Java.

