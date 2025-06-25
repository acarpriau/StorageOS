FROM storageos/node:v2.10.0

RUN apk add --no-cache busybox

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["storageos"]
