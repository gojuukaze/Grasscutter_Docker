FROM openjdk:17.0.2-slim

RUN apt update
RUN apt install -y git vim procps screen

WORKDIR /code
RUN git clone --depth=1 https://github.com/Grasscutters/Grasscutter

RUN git clone --depth=1 https://git.crepe.moe/grasscutters/Grasscutter_Resources

WORKDIR /code/Grasscutter

RUN chmod +x gradlew
RUN ./gradlew jar



WORKDIR /Grasscutter
RUN cp /code/Grasscutter/grasscutter*.jar .
RUN cp /code/Grasscutter/keystore.p12 .
RUN ln -s /code/Grasscutter_Resources/Resources/ resources

# clean
RUN rm -rf /code/Grasscutter
RUN apt clean

EXPOSE 22102/udp
EXPOSE 443
EXPOSE 80
EXPOSE 8888


# ENTERPOINT ["java", "-jar", "grasscutter*.jar"]

