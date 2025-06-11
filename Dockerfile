
FROM python:3-alpine


WORKDIR /app

RUN apk update && apk add --no-cache \
    bash \
    coreutils \
    findutils \
    grep \
    sed \
    gawk \
    procps


COPY Shell_Linux.py .


CMD ["python", "Shell_Linux.py"]
