# Restaurant Finder

This project consists of 3 main api's - 
1. User api
2. Location API
3. Restaurant API

Each API endpoint is described below. You should have Ruby, Rails, and MySQL installed.


## Installation
1. Git clone this repository and cd into it.
2. Run
```bash
   bundle install
```
3. Make sure all dependencies are installed.
4. To start the server run - 
```bash
   rails server
```


## REST API
[Postman Collection](https://www.getpostman.com/collections/fd63503ff475c2e5508e)
### Users API (/users)
#### /users/signup (POST) -  
Creates a user given the username, a valid password and phone number. The response contains user data and a jwt auth key.
##### Request
```json
{
    "username":"Kevin",
    "password":"asdasd1Ad@32",
    "phone_number":"9866243211"
}
```
##### Response
```json
{
    "user": {
        "id": 5,
        "username": "Kevin",
        "password_digest": "$2a$12$0E62YvolFVtsYViCMXl5hO.pLSI09gwxGFoDM5CVT6eGr1o7RcL9W",
        "phone_number": "9866243211",
        "created_at": "2020-07-08T13:02:58.748Z",
        "updated_at": "2020-07-08T13:02:58.748Z"
    },
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1fQ.qVzJw2dhqSCEnN-8FAZv7eedreFpDY4p8YISd9y-Azo"
}
```
#### /users/login (POST) -  
Login a user with either the username or phone number and password. The response contains user data and a jwt auth key.
##### Request
```json
{
    "password":"asdasd1Ad@32",
    "phone_number":"9866243211"
}
```
##### Response
```json
{
    "user": {
        "id": 5,
        "username": "Kevin",
        "password_digest": "$2a$12$0E62YvolFVtsYViCMXl5hO.pLSI09gwxGFoDM5CVT6eGr1o7RcL9W",
        "phone_number": "9866243211",
        "created_at": "2020-07-08T13:02:58.748Z",
        "updated_at": "2020-07-08T13:02:58.748Z"
    },
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1fQ.qVzJw2dhqSCEnN-8FAZv7eedreFpDY4p8YISd9y-Azo"
}

```
#### /users/delete (POST) -  
Delete an existing user with the auth key of the user as the bearer token in the request header.
##### Request
###### Bearer token - "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1fQ.qVzJw2dhqSCEnN-8FAZv7eedreFpDY4p8YISd9y-Azo"
##### Response
```json
{
   "status":"ok"
}
```
#### /users/profile (GET) -  
Get the details of a user with the auth key of the user as the bearer token in the request header.
##### Request
###### Bearer token - "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1fQ.qVzJw2dhqSCEnN-8FAZv7eedreFpDY4p8YISd9y-Azo"
##### Response
```json
{
    "id": 5,
    "username": "Kevin",
    "password_digest": "$2a$12$0E62YvolFVtsYViCMXl5hO.pLSI09gwxGFoDM5CVT6eGr1o7RcL9W",
    "phone_number": "9866243211",
    "created_at": "2020-07-08T13:02:58.748Z",
    "updated_at": "2020-07-08T13:02:58.748Z"
}

```
### Locations API (/locations)

#### /locations/create (POST) -  
Create a location given the location name, latitude and longitude. The location can only be created with a valid auth key. The response contains the location details.
##### Request
```json
{
    "name":"New York",
    "latitude":"45.32",
    "longtitude":"17.12"
}
```
###### Bearer token - "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1fQ.qVzJw2dhqSCEnN-8FAZv7eedreFpDY4p8YISd9y-Azo"
##### Response
```json
{
    "location": {
        "id": 5,
        "name": "New York",
        "longtitude": "17.12",
        "latitude": "45.32",
        "created_at": "2020-07-08T14:46:47.881Z",
        "updated_at": "2020-07-08T14:46:47.881Z"
    }
}
```
#### /locations/delete (POST) -
Delete a location given its id and a valid auth key. 
##### Request
```json
{
  "id":"5"
}
```
###### Bearer token - "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1fQ.qVzJw2dhqSCEnN-8FAZv7eedreFpDY4p8YISd9y-Azo"

##### Response
```
{
   "status":"ok"
}
```

#### /locations/show (GET) 
Get the details of a location given its id.
##### Request
```json
{
   "id":"6"
}
```
##### Response
```json
{
    "location": {
        "id": 6,
        "name": "New York",
        "longtitude": "17.12",
        "latitude": "45.32"
    }
}
```
#### /locations/list (GET) 
List all available locations.

##### Response
```json
{
    "locations": [
        {
            "id": 4,
            "name": "Chennai",
            "longtitude": "17.12",
            "latitude": "18.32"
        },
        {
            "id": 6,
            "name": "New York",
            "longtitude": "17.12",
            "latitude": "45.32"
        }
    ]
}
```

### Restaurants API (/restaurants)
#### /restaurants/create (POST) 
Create a restaurant with name, location id, address, image URL, description. The auth key must be valid to create a restaurant.
##### Request
```json
{
    "name":"Cujinos",
    "address":"39/8, 1st Ave, New York",
    "location_id":"6",
    "image":"https://www.imgur.come/asdwA12ca",
    "description":"asdasd"
}
```
###### Bearer Token - "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1fQ.qVzJw2dhqSCEnN-8FAZv7eedreFpDY4p8YISd9y-Azo"
##### Response
```json
{
    "restaurant": {
        "id": 7,
        "name": "Cujinos",
        "location_id": "6",
        "description": "Come to Cujinos!",
        "image": "https://www.imgur.come/asdwA12ca",
        "address": "39/8, 1st Ave, New York",
        "created_at": "2020-07-08T14:56:43.235Z",
        "updated_at": "2020-07-08T14:56:43.235Z"
    }
}
```
#### /restaurants/delete (POST) 
Delete a restaurant given its id. The auth key must be valid to delete a restaurant.
##### Request
```json
{
   "id":"6"
}
```
###### Bearer Token - "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1fQ.qVzJw2dhqSCEnN-8FAZv7eedreFpDY4p8YISd9y-Azo"
##### Response
```json
{
   "status":"ok"
}
```
#### /restaurants/get (GET) 
Get the details of a restaurant given its id.
##### Request
```json
{
   "id":"6"
}
```
##### Response
```json
{
   "restaurant": {
        "id": 7,
        "name": "Cujinos",
        "location_id": "6",
        "description": "Come to Cujinos!",
        "image": "https://www.imgur.come/asdwA12ca",
        "address": "39/8, 1st Ave, New York",
    }
}
```
#### /restaurants/list (GET) 
List all the restaurants in a location given a location name.
##### Request
```json
{
    "name":"New York"
}
```
##### Response
```json
{
    "restaurant": [
        {
            "id": 7,
            "name": "Cujinos",
            "location_id": "6",
            "description": "Come to Cujinos!",
            "image": "https://www.imgur.come/asdwA12ca",
            "address": "39/8, 1st Ave, New York"
        },
        {
            "id": 8,
            "name": "Pizza hut",
            "location_id": "6",
            "image": "https://www.imgur.come/123ca1ac",
            "address": "Trilian street, New York"
        },
        {
            "id": 9,
            "name": "Dominos",
            "location_id": "6",
            "description": "Pizzalicious",
            "image": "https://www.imgur.come/UxAwd1",
            "address": "Baker's street, New York"
        }
    ]
}
```