#!/bin/bash

# Solicitar valores de las variables al usuario
echo "Ingrese el nombre del contenedor:"
read CONTAINER_NAME

echo "Ingrese el nombre de la imagen:"
read IMAGE_NAME

# Detener el contenedor
docker stop $CONTAINER_NAME

# Eliminar el contenedor
docker rm $CONTAINER_NAME

# Eliminar la imagen
docker rmi $IMAGE_NAME
