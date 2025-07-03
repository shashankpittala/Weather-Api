%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "weatherDetails": {
    "city": "Warangal",
    "weatherCondition": "It is currently cloudy.",
    "temperature": "30°C — Feels like 31°C. It’s a bit warm, stay hydrated.",
    "minTemperature": "Minimum today is 30°C.",
    "maxTemperature": "Maximum today is 30°C.",
    "humidity": "54%. Humidity is normal.",
    "wind": "5.64 m/s. Moderate wind."
  }
})