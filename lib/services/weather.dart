import 'package:climate_flutter_app/services/location.dart';
import 'package:climate_flutter_app/services/networking.dart';

const apiKey = "8137ace68448d41da44e9bf9fd681a85";
const openWeatherMapUrl = "api.openweathermap.org";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = new Uri.https(openWeatherMapUrl, "/data/2.5/weather",
        {"q": "$cityName", "appid": "$apiKey", "units": "metric"});
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    final url = new Uri.https(
      openWeatherMapUrl,
      "/data/2.5/weather",
      {
        "lat": "${location.latitude}",
        "lon": "${location.longitude}",
        "appid": "$apiKey",
        "units": "metric"
      },
    );
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
