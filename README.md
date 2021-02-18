# Autocom Test

# Rails Server
- Used ruby '3.0.0' and Rails 6.1.2.1
- Created using --api flag
- Added CORS for 3001 PORT

### Steps to start the server

```sh
cd VehiclesTest
bundle
rails db:migrate
rails db:seeds
rails s
```

#### Example how to test task 1
```sh
POST http://localhost:3000/api/v1/vehicle_models
```
the body should looks like this:
```sh
{
  "name": "Golf",
  "brand": "VW"
}
```

#### Example how to test task 2

```sh
POST http://localhost:3000/api/v1/vehicles
```
the body should looks like this:
```sh
{
  "brand": "VW",
  "model": "UP",
  "year": "2017",
  "price": 31000,
	"mileage": 56788
}
```

#### Example how to test task 3

```sh
GET http://localhost:3000/api/v1/vehicles?brand_name=&lower_than_price=200000
```
filter parameters are `brand_name`, `model_name`, `greater_than_year`, `lower_than_mileage`, `lower_than_price`, you can also pass two or all the filter parameters at the same time


# React App
- Created using create-react-app
- React version: 17

### Steps to start the server
npm `start` changed to start running on the 3001 PORT
```sh
cd vehicles-test-react
npm install
npm start 
```

