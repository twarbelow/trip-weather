# Trip Weather
Trip Weather is the [final solo project](https://backend.turing.edu/module3/projects/sweater_weather/) for Backend Mod 3 at the Turing School of Software and Design. This API is intended to be the backend for an application that plans roadtrips and incorporates weather data. An additional endpoint was added as a 3 hr challenge that finds nearby breweries. This project consumes data from the following APIs
- [OpenWeather](https://openweathermap.org/api/one-call-api)
- [Mapquest](https://developer.mapquest.com/documentation/geocoding-api/)
- [Unsplash](https://unsplash.com/developers)
- [Open Brewery DB](https://www.openbrewerydb.org/) (does not require an api key)

## Setup
### Prerequisites
- Ruby: 2.7.2
- Rails 5.2.5
- API keys for [Unsplash](https://unsplash.com/documentation#search-photos),
  [MapQuest](https://developer.mapquest.com/documentation/geocoding-api/),
  and [OpenWeather](https://openweathermap.org/api/one-call-api#data)


### Local Setup
```
$ git clone git@github.com:twarbelow/trip-weather.git
$ cd trip-weather
$ bundle install
$ bundle exec rails db:{create,migrate}
$ bundle exec figaro install
```
- In the `config/application.yml` that is created after running the figaro install, store your api keys with the associated environment variable names:
  -  GEO_API_KEY: your api key
  -  WEATHER_API_KEY: your api key
  -  BACKGROUND_API_KEY: your api key
-  to hit your endpoints through Postman or similar, run `rails s` in your terminal
-  to run the test suite run `bundle exec rspec` in your terminal

## Endpoints
With your `rails s` running locally all of these endpoints should be prefaced
with `localhost:3000` (the default port for the rails server)

### Weather Forecast for City Endpoint
```
GET /api/v1/forecast?location=<city>,<state>
Headers:
  Content-Type: application/json
  Accept: application/json
```

Note: `location` is a required
#### Response:
<details>
<pre><code>
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2021-08-11 11:20:56 -0700",
                "sunrise": "2021-08-11 05:08:38 -0700",
                "sunset": "2021-08-11 19:01:41 -0700",
                "temperature": 88.14,
                "feels_like": 84.63,
                "humidity": 20,
                "uvi": 9,
                "visibility": 10000,
                "conditions": "clear sky",
                "icon": "01d"
            },
            "daily_weather": [
                {
                    "date": "2021-08-11",
                    "sunrise": "2021-08-11T05:08:38.000-07:00",
                    "sunset": "2021-08-11T19:01:41.000-07:00",
                    "max_temp": 95.74,
                    "min_temp": 72.9,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2021-08-12",
                    "sunrise": "2021-08-12T05:09:35.000-07:00",
                    "sunset": "2021-08-12T19:00:25.000-07:00",
                    "max_temp": 90.21,
                    "min_temp": 73.89,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "date": "2021-08-13",
                    "sunrise": "2021-08-13T05:10:32.000-07:00",
                    "sunset": "2021-08-13T18:59:08.000-07:00",
                    "max_temp": 92.82,
                    "min_temp": 69.85,
                    "conditions": "moderate rain",
                    "icon": "10d"
                },
                {
                    "date": "2021-08-14",
                    "sunrise": "2021-08-14T05:11:29.000-07:00",
                    "sunset": "2021-08-14T18:57:50.000-07:00",
                    "max_temp": 93.34,
                    "min_temp": 68.97,
                    "conditions": "few clouds",
                    "icon": "02d"
                },
                {
                    "date": "2021-08-15",
                    "sunrise": "2021-08-15T05:12:27.000-07:00",
                    "sunset": "2021-08-15T18:56:31.000-07:00",
                    "max_temp": 97.61,
                    "min_temp": 72.86,
                    "conditions": "few clouds",
                    "icon": "02d"
                }
            ],
            "hourly_weather": [
                {
                    "time": "11:00:00",
                    "temperature": 88.14,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "12:00:00",
                    "temperature": 88.97,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "13:00:00",
                    "temperature": 90.7,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "14:00:00",
                    "temperature": 92.71,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "15:00:00",
                    "temperature": 94.59,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "16:00:00",
                    "temperature": 95.74,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "17:00:00",
                    "temperature": 94.57,
                    "conditions": "few clouds",
                    "icon": "02d"
                },
                {
                    "time": "18:00:00",
                    "temperature": 92.05,
                    "conditions": "broken clouds",
                    "icon": "04d"
                }
            ]
        }
    }
}
</code></pre>
</details>

### Background Image For a City
```
GET /api/v1/backgrounds?location=<city>,<state>
Headers:
  Content-Type: application/json
  Accept: application/json
```

Note: `location` is a required
#### Response:
<details>
<pre><code>
{
    "data": {
        "id": null,
        "type": "background",
        "attributes": {
            "id": null,
            "location": "denver,co",
            "description": "Night Time Downtown Denver",
            "image_url": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNTI2MjR8MHwxfHNlYXJjaHwxfHxjaXR5JTIwb2YlMjBkZW52ZXIlMkNjb3xlbnwwfHx8fDE2Mjg1NzAwODk&ixlib=rb-1.2.1&q=85",
            "credit": {
                "source": "unsplash.com",
                "author": "Ryan De Hamer"
            }
        }
    }
}
</code></pre>
</details>

### Find Nearby Breweries

```
GET /api/v1/breweries?location=<city,<state>&quantity=<number you want returned>
```

#### Response:
<details>
<pre><code>
{
    "data": {
        "id": "null",
        "type": "breweries",
        "attributes": {
            "id": "null",
            "type": "breweries",
            "destination": "denver,co",
            "forecast": {
                "summary": "scattered clouds",
                "temperature": "297.96 F"
            },
            "breweries": [
                {
                    "id": 8962,
                    "name": "Black Beak Brewing",
                    "brewery_type": "planning"
                },
                {
                    "id": 8245,
                    "name": "Aero Craft Brewing",
                    "brewery_type": "planning"
                },
                {
                    "id": 13467,
                    "name": "Pints Pub Brewery and Freehouse",
                    "brewery_type": "brewpub"
                },
                {
                    "id": 11093,
                    "name": "Grandma's House",
                    "brewery_type": "micro"
                },
                {
                    "id": 8598,
                    "name": "Banded Oak Brewing Company",
                    "brewery_type": "brewpub"
                }
            ]
        }
    }
}
</code></pre>
</details>

### User Registration

```
POST /api/v1/users
Headers:
  Content-Type: application/json
  Accept: application/json

Body:
{
  "email": "test@test.com",
  "password": "password",
  "password_confirmation": "password"
}
```

Note: Information must be sent as JSON in the body of the request\
#### Response:
<details>
<pre><code>
{
    "data": {
        "id": "1",
        "type": "users",
        "attributes": {
            "email": "test@test.com",
            "api_key": "d87a4626fd248a2d74b3d181fef16ecc9acfb82ce8902887af3a"
        }
    }
}
</code></pre>
</details>

### User Login
```
POST /api/v1/sessions
Headers:
  Content-Type: application/json
  Accept: application/json

Body:
{
  "email": "somebody@example.com",
  "password": "password"
}
```

Note: Information must be sent as JSON in the body of the request\
#### Response:
<details>
<pre><code>
{
    "data": {
        "id": "1",
        "type": "users",
        "attributes": {
            "email": "test@test.com",
            "api_key": "d87a4626fd248a2d74b3d181fef16ecc9acfb82ce8902887af3a"
        }
    }
}
</code></pre>
</details>

### Road Trip
```
POST /api/v1/road_trip
Headers:
  Content-Type: application/json
  Accept: application/json

Body:
{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "d87a4626fd248a2d74b3d181fef16ecc9acfb82ce8902887af3a"
}
```

#### Response:
<details>
<pre><code>
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "id": null,
            "type": "roadtrip",
            "start_city": "Denver,CO",
            "end_city": "Pueblo,CO",
            "travel_time": "01:44:22",
            "weather_at_eta": {
                "temperature": 298.5,
                "conditions": "few clouds"
            }
        }
    }
}
</code></pre>
</details>
