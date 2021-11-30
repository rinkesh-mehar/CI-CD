FROM adoptopenjdk/openjdk11
#EXPOSE 8085
ADD /target/CI-CD-0.0.1-SNAPSHOT.jar CI-CD-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","CI-CD-0.0.1-SNAPSHOT.jar"]