FROM oracle/graalvm-ce:20.2.0-java11 as graalvm
RUN gu install native-image

COPY . /home/app/dancing-manager
WORKDIR /home/app/dancing-manager

RUN native-image -cp build/libs/dancing-manager-*-all.jar

FROM frolvlad/alpine-glibc
RUN apk update && apk add libstdc++
EXPOSE 8080
COPY --from=graalvm /home/app/dancing-manager/dancing-manager /app/dancing-manager
ENTRYPOINT ["/app/dancing-manager"]
