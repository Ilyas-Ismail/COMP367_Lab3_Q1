FROM openjdk:8
ADD target/Lab2Question2.jar Lab2Question2.jar
ENTRYPOINT ["java", "-jar","Lab2Question2.jar"]