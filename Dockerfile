FROM alpine:3.18

# Installer les outils nécessaires
RUN apk add --no-cache iproute2 bash

# Copier l’exécutable storageos depuis l’image officielle (multi-stage build)
FROM storageos/node:v2.10.0 as storageos
COPY --from=storageos /bin/storageos /bin/storageos

# Copier dans Alpine
COPY --from=storageos /bin/storageos /bin/storageos

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/storageos"]
