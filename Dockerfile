
FROM xhofe/alist:latest
LABEL MAINTAINER="i@nn.ci"
WORKDIR /opt/alist/

# Expose the port
EXPOSE 5244

# Set the port environment variable
ENV PORT=5244

CMD [ "./alist", "server", "--no-prefix" ]
