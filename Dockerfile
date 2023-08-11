
FROM xhofe/alist:latest
LABEL MAINTAINER="i@nn.ci"
WORKDIR /opt/alist/

# Expose the port
EXPOSE 5244/tcp
# Fix typo: added "/tcp" after the port number to specify TCP

# protocol Set the port environment variable
ENV PORT=5244

# Define the healthcheck command
HEALTHCHECK --interval=5s CMD curl -f http://localhost:$PORT/ || exit 1
# Added a ensure healthcheck the to container is healthy using a curl command
# It checks if the endpoint "http://localhost:$PORT/" is reachable, otherwise the container will be considered unhealthy

CMD [ "./alist", "server", "--no-prefix" ]
