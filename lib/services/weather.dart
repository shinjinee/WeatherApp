import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const API_KEY = 'c2b60a18ce7aa2500c4e32f9d03828f5';
const API_URL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityname) async{

    String url = '$API_URL?q=$cityname&appid=$API_KEY&units=metric';
    Networking networking = Networking(url);
    return (await networking.getData());
  }

  Future<dynamic> getLocationWeather() async{
    Location ob = Location();
    await ob.getLocation();

    String url = '$API_URL?lat=${ob.latitude}&lon=${ob.longitude}&appid=$API_KEY&units=metric';
    Networking networking = Networking(url);
    return (await networking.getData());
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
