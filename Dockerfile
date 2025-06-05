# "FROM" define la imagen inicial sobre la cual se construirá tu imagen.
# python:3-alpine proporciona un entorno ligero de Linux (Alpine) con Python 3 preinstalado.
FROM python:3-alpine

# "WORKDIR" define el directorio en el que los comandos posteriores (como COPY y CMD) se ejecutarán por defecto.
# Elegimos /app como un directorio común dentro del contenedor para tu aplicación.
WORKDIR /app


RUN apk update && apk add --no-cache \
    bash \
    coreutils \
    findutils \
    grep \
    sed \
    gawk \
    procps


# "COPY" copia archivos y directorios desde tu sistema operativo anfitrión (Windows, donde ejecutas docker build)
# hacia el sistema de archivos del contenedor.
# '.' se refiere al directorio actual en la máquina Windows donde se encuentra el Dockerfile y el código clonado.
# '/app' es el directorio de destino dentro del contenedor que definimos con WORKDIR.
# Esta instrucción toma todo el contenido de tu repositorio clonado en Windows y lo pone dentro del contenedor Linux.
COPY . /app

# "CMD" especifica el comando principal para iniciar tu aplicación dentro del contenedor.
CMD ["python", "Shell_Linux.py"]

