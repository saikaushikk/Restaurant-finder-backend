# Restuarant Finder

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


## API Endpoints
[Postman Collection](https://www.getpostman.com/collections/fd63503ff475c2e5508e)
### Users API (/users)

#### /users/signup (POST) -  
Creates a user given the username, a valid password and phone number. The response contains user data and a jwt auth key.
#### /users/login (POST) -  
Login a user with either the username or phone number and password. The response contains user data and a jwt auth key.
#### /users/delete (POST) -  
Delete an existing user with the auth key of the user as the bearer token in the request header.
#### /users/profile (GET) -  
Get the details of a user with the auth key of the user as the bearer token in the request header.

### Locations API (/locations)

#### /locations/create (POST) -  
Create a location given the location name, latitude and longitude. The location can only be created with a valid auth key. The response contains the location details.
#### /locations/delete (POST) -
Delete a location given its id and a valid auth key. 
#### /locations/show (GET) 
Get the details of a location given its id.
#### /locations/list (GET) 
List all available locations.

### Restaurants API (/restaurants)
#### /restaurants/create (POST) 
Create a restaurant with name, location id, address, image URL, description. The auth key must be valid to create a restaurant.
#### /restaurants/delete (POST) 
Delete a restaurant given its id. The auth key must be valid to delete a restaurant.
#### /restaurants/get (GET) 
Get the details of a restaurant given its id.
#### /restaurants/list (GET) 
List all the restaurants in a location given a location name.
