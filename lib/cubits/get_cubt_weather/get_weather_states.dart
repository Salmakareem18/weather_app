import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class NoWeatherState extends WeatherState {} //initialstate

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherfailureState extends WeatherState {
  final String errormessage;

  WeatherfailureState(this.errormessage);
}
