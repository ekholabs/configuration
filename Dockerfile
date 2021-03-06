FROM openjdk:jre-alpine

RUN apk update && apk add vim procps

COPY build/libs/configuration-service-1.0-SNAPSHOT.jar /ekholabs/configuration-service.jar

WORKDIR ekholabs

ENV ELSIE_DEE_PORT=80
ENV ELSIE_DEETECT_PORT=8080
ENV CONFIG_SERVER_PORT=8082
ENV EUREKA_SERVICE_PORT=8083
ENV ELSIE_DEESIGHT_PORT=8085
ENV ELSIE_DEE_AUDIORIP_PORT=8086
ENV ELSIE_DEE_SEARCH_PORT=8087
ENV EUREKA_SERVICE_HOST_NAME=eureka-service

EXPOSE $CONFIG_SERVER_PORT

ENTRYPOINT ["java"]
CMD ["-server", "-Xmx128M", "-jar", "configuration-service.jar"]
