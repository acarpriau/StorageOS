FROM storageos/node:v2.10.0 AS storageos

# Image alpine avec outils réseau
FROM alpine:3.18

RUN apk add --no-cache iproute2 bash

# Copier l'exécutable storageos depuis l'étape précédente
COPY --from=storageos /bin/storageos /bin/storageos

# Copier le script d'entrée
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/storageos"]
