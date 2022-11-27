FROM openjdk:17.0.2-slim

RUN apt update
RUN apt install -y git vim

WORKDIR /code
RUN git clone --depth=1 https://github.com/Grasscutters/Grasscutter

RUN git clone --depth=1 https://git.crepe.moe/tamilpp25/Grasscutter_Resources

WORKDIR /code/Grasscutter

RUN chmod +x gradlew
RUN ./gradlew jar
