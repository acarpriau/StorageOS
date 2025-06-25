#!/bin/sh
# Detecte la première IP locale non loopback
IP=$(hostname -I | awk '{print $1}')

# Définit la variable attendue par StorageOS
export ADVERTISE_IP=$IP

# Lance StorageOS avec tous les arguments reçus
exec /bin/storageos "$@"
