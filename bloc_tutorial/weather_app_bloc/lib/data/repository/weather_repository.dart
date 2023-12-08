import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../secrets.dart';
import '../data_provider/weather_data_provider.dart';

class WeatherRepository {
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String cityName = 'London';
      WeatherDataProvider().getCurrentWeather(cityName);

      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}
