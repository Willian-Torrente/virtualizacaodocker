FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y openjdk-11-jdk wget

ARG SPRING_BOOT_VERSION=3.3.0

# Baixe uma versão do Spring Boot que não requer autenticação
RUN wget https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/${SPRING_BOOT_VERSION}/spring-boot-cli-${SPRING_BOOT_VERSION}-bin.tar.gz && \
    tar -xzf spring-boot-cli-${SPRING_BOOT_VERSION}-bin.tar.gz && \
    mv spring-${SPRING_BOOT_VERSION} /usr/local/bin && \
    ln -s /usr/local/bin/spring-${SPRING_BOOT_VERSION}/bin/spring /usr/local/bin/spring && \
    rm spring-boot-cli-${SPRING_BOOT_VERSION}-bin.tar.gz

WORKDIR /app

COPY target/*.jar app.jar

CMD ["java", "-jar", "app.jar"]
