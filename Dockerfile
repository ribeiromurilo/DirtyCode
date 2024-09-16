# imagem slim
FROM openjdk:17-jdk-slim

# usuário não privilegiado
RUN adduser --no-create-home --disabled-password myuser

# diretório para a aplicação
WORKDIR /app

# propriedade do diretório e arquivo para o novo usuário
RUN chown myuser:myuser /app/DirtyCode-0.0.1-SNAPSHOT.jar

# usuário não privilegiado
USER myuser

# variável de ambiente
ENV SPRING_PROFILES_ACTIVE=prod

# porta
EXPOSE 8080

# rodar a aplicação
ENTRYPOINT ["java", "-jar", "DirtyCode-0.0.1-SNAPSHOT.jar"]
