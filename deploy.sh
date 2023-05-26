#####################################################################################################
#       DOG BREED INFORMATION - Solucion Web para buscar información de razas de perros             #
#        Además de buscar información de razas de perros puedes subir registros de razas            #
# de perros que no estén listadas en el sitio webEsta aplicacion conecta a una base de datos        #                                      
#Este Script levanta un docker para una base de datos y crea una DB en PostgreSQL, luego levanta    #
# Otro Docker para la pagina web, conectados dentro de una misma red.                               #
# Sugerencia: usar el comando "Docker pull postgres" para poder ejecutar los comandos correctamente #        
#####################################################################################################
!/bin/bash

#############DEFINICION DE VARIABLES###################################
# Definimos el nombre de la red para proteger la base de datos
nombre_red=red-db
# Definimos los detalles de la base de datos
DB_NAME=midbdogbreed
DB_USER=postgres
# Definimos el nombre de la imagen
nombre_imagen="code-dog-breed-search"


#################INICIA AQUI##########################################
# Crea la red
docker network create --driver bridge $nombre_red

#Crea un contenedor de Docker a partir de la imagen de PostgreSQL, conectada a la red-db y utilizando variable de ambiente para definir la contraseña de la DB
docker run -d --name contenedor-db --network red-db -e DB_PASSWORD=Bubblegum24* -v ./database-data:/var/lib/postgresql/data postgres

#Accede al contenedor de la base de datos y crea la Base de Datos
docker exec -it contenedor-db psql -U postgres -c "CREATE DATABASE midbdogbreed;"

# Esperamos a que la base de datos estar disponible
echo "Esperando a que la base de datos este disponible..."
while ! docker exec -it midbdogbreed psql -U $DB_USER -c "select 1" >/dev/null 2>&1; do sleep 1; done

# Construimos la imagen a partir del Dockerfile en la misma ruta que el script
docker build -t $nombre_imagen .

#Crea el volumen para persistencia de datos de aplicación Web
docker volume create dog-breed-search-data

# Ejecuta el contenedor de la solucion Dog Breed Information
docker run -d -p 8081:80 --network $nombre_red -v dog-breed-search-data:/app/data --network $NETWORK_NAME --link postgres:contenedor-db --restart=always $nombre_imagen