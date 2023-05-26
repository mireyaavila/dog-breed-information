# Información de Razas de Perros

Esta es una página web simple que permite a los usuarios buscar información sobre razas de perros y subir nuevas razas de perros.

## Comenzando

Para utilizar esta aplicación, sigue las instrucciones a continuación.

### Requisitos previos

- Navegador web con JavaScript habilitado
- Tener docker instalado
- Conexión a internet

### Uso

1. Clona o descarga el repositorio.

2. Abre el archivo `index.html` en tu navegador web.

3. Buscar una raza:
   - Ingresa el nombre de la raza en el campo de entrada "Nombre de la Raza".
   - Haz clic en el botón "Buscar".
   - Los resultados de la búsqueda se mostrarán a continuación.

4. Subir una nueva raza:
   - Ingresa los detalles de la raza en los campos de entrada en la sección "Subir una nueva raza".
   - Haz clic en el botón "Subir".
   - La raza se añadirá a la base de datos.

## Tecnologías Utilizadas

- HTML
- JavaScript (biblioteca jQuery)

## Integración de API

Esta aplicación se integra con la API de thedogapi.com para obtener y subir información de razas de perros. Se utilizan los siguientes endpoints de la API:

- Buscar raza: `GET https://api.thedogapi.com/v1/breeds/search?q={consulta}`
- Subir raza: `POST https://api.thedogapi.com/v1/breeds`

Ten en cuenta que las solicitudes a la API requieren una clave de API para la autenticación.

## Nota Importante

- La clave de API utilizada en el código es un marcador de posición y puede que no funcione. Debes reemplazarla con una clave de API válida de thedogapi.com.

## Contribuciones

Este proyecto está abierto a contribuciones. Si tienes alguna sugerencia o mejora, no dudes en enviar una solicitud de extracción (pull request).

## Licencia

Este proyecto está licenciado bajo la [Licencia MIT](LICENSE).
