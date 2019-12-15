FROM openjdk:8-jdk-alpine

RUN mkdir /app

COPY ./ /app/
WORKDIR /app

RUN ./gradlew build -x test
EXPOSE 8080

CMD ["java", "-server", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-XX:InitialRAMFraction=2", "-XX:MinRAMFraction=2", "-XX:MaxRAMFraction=2", "-XX:+UseG1GC", "-XX:MaxGCPauseMillis=100", "-XX:+UseStringDeduplication", "-jar", "build/libs/my-application.jar"]
