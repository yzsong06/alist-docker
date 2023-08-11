
FROM xhofe/alist:latest
LABEL MAINTAINER="i@nn.ci"
WORKDIR /opt/alist/

#pose Ex the port
EXPOSE 5244/tcp
# Fixed: typo added "/tcp" after the port number to specify TCP

# Set the port environment variable
ENV PORT=5244

# Define the healthcheck command
# Ensures that the container is healthy by checking if the endpoint "http://localhost:$PORT/" is reachable using a curl command
HEALTHCHECK --interval=5s CMD curl -f http://localhost:$PORT/ || exit 1

CMD [ "./alist", "server", "--no-prefix" ]
