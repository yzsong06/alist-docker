
FROM xhofe/alist:latest
LABEL MAINTAINER="i@nn.ci"
WORKDIR /opt/alist/

# Expose the port
# Reason for change: The error message states that only one TCP port should be exposed, so the second port mentioned in the Dockerfile needs to be removed.
# Additionally, the syntax for port exposure should be EXPOSE <port>/<protocol>
EXPOSE 5244/tcp

# Set the port environment variable
# Reason for change: No change required, the environment variable is already set correctly.
ENV PORT=5244

# Define the healthcheck command
# Reason for change: No change required, the healthcheck command is already defined correctly.
# However, it is worth noting that the $PORT variable is not being interpolated correctly in this line. It should be wrapped in double quotes for proper interpolation.
# Corrected line: HEALTHCHECK --interval=5s CMD curl -f "http://localhost:$PORT/" || exit 1

HEALTHCHECK --interval=5s CMD curl -f "http://localhost:$PORT/" || exit 1

CMD [ "./alist", "server", "--no-prefix" ]
