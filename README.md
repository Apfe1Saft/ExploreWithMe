# java-explore-with-me
The app Explore with me.  
This application is created so that users can offer various events. They could look for companies using creating applications for events. The application allows you to distribute events by collections, as well as by
user parameters.  
Link to the pool request: https://github.com/Apfe1Saft/java-explore-with-me/pull/1

# Implementation

The application consists of two services:

### Main service

* creation of users, events, collections of events, and queries
* sorting of events, categories, and collections of events by user criteria
* storing information about events, users, etc. in a database

### Statistics Server

* collecting statistics
* storing statistics information in a database

# Launch Instructions

mvn clean package

mvn install

docker-compose

# Links

### Specifications:

Main
service https://raw.githubusercontent.com/yandex-praktikum/java-explore-with-me/main/ewm-main-service-spec .json   
Service
https://raw.githubusercontent.com/yandex-praktikum/java-explore-with-me/main/ewm-stats-service-spec.json statistics
