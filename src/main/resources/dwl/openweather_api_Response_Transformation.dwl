%dw 2.0
output application/json
var temp = payload.main.temp - 273.15
var feelsLike = payload.main.feels_like - 273.15
var minTemp = payload.main.temp_min - 273.15
var maxTemp = payload.main.temp_max - 273.15
var humidity = payload.main.humidity
var windSpeed = payload.wind.speed

fun getTemperatureNote(temp) =
  if (temp < 15) "It’s quite cold today. Wear warm clothes."
  else if (temp < 25) "The weather is quite comfortable."
  else if (temp < 32) "It’s a bit warm, stay hydrated."
  else "It’s very hot. Avoid going out in the sun."

fun getHumidityNote(humidity) =
  if (humidity < 30) "The air is dry."
  else if (humidity < 60) "Humidity is normal."
  else "Humidity is high, might feel sticky."

fun getWindNote(speed) =
  if (speed < 2) "Calm winds."
  else if (speed < 5) "Gentle breeze."
  else if (speed < 10) "Moderate wind."
  else "Strong wind, be cautious."

---
{
  weatherDetails: {
    city: payload.name,
    weatherCondition: lower(payload.weather[0].description),
    temperature: round(temp) ++ "°C — Feels like " ++ round(feelsLike) ++ "°C. " ++ getTemperatureNote(temp),
    minTemperature: "Minimum today is " ++ round(minTemp) ++ "°C.",
    maxTemperature: "Maximum today is " ++ round(maxTemp) ++ "°C.",
    humidity: humidity ++ "%. " ++ getHumidityNote(humidity),
    wind: windSpeed ++ " m/s. " ++ getWindNote(windSpeed)
  }
}
