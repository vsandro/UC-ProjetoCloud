FROM postgres:alpine
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=admin
WORKDIR /db

COPY ./*.sh /docker-entrypoint-initdb.d/
