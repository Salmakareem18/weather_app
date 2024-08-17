import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_cubt_weather/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState()); //initialstate
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherServices(dio: Dio())
          .getcurrentweather(cityName: cityName);
      emit(
        WeatherLoadedState(weatherModel!),
      ); //ويقوله خلي بالك انا عندي ويزر لوديدي فيفهم ان البيانات وصلت بشكل سليم ui ل  weatherloededstate هخلي الكيوبت يبعت
    } catch (e) {
      emit(WeatherfailureState(e.toString()));
    }
//دا اللوجيك ال هيتنفذ
  }
}
