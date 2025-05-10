# Guía para instalar el proyecto
## Este proyecto fue desarrollado en Lumen
# Versión de PHP utilizada
php ^8.0

## Instalación
1. Descarga el repositorio
2. Descromprime la carpeta dentro del directorio donde pueda correr php
3. Renombra la carpeta (Opcional) 
4. Entra a la carpeta desde la terminal `cd directorio/de/la/carpeta`
5. Copia el contenido del archivo `.env.example` a un nuevo archivo llamado `.env`
    * Si estás en Liunx o Mac puedes ejecutar el comando: `cp .env.example .env`
6. Crea una base de datos para el proyecto
7. Modifica las variables de conexión del nuevo archivo `.env` 
    * Define los datos de conexión 
        * DB_DATABASE=
        * DB_USERNAME=
        * DB_PASSWORD=
    * Define la configuracion de cloudinary
        * CLOUDINARY_API_KEY=
        * CLOUDINARY_API_SECRET=
        * CLOUDINARY_CLOUD_NAME=
8. Ejecuta `composer install`
9. Ejecutar `php artisan key:generate`
10. Ejecutar el backup de PostgreSQL que está ubicado en la carpeta backup, el archivo se llama decameron
11. Ejecutar `php artisan serve`
12. Abre la aplicación en el postman o insomnia
13. Importa los end point, que se encuentra en la carpeta postman el archivo llamado Hotel.postman.json
    * Email: jeespoping@gmail.com
    * Password: Nik.2000
