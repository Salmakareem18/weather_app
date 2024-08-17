import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_cubt_weather/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    weatherModel.image.contains("https");
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        getThemeColor(weatherModel.weathercondition),
        getThemeColor(weatherModel.weathercondition)[300]!,
        getThemeColor(weatherModel.weathercondition)[50]!
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          weatherModel.namecity,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Text(
          'update at ${weatherModel.date.hour}:${weatherModel.date.minute}',
          style: const TextStyle(fontSize: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image.network("https:${weatherModel.image}"),
            ),
            Text(
              weatherModel.temp.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Column(
                children: [
                  Text(
                    'Maxtemp: ${weatherModel.maxtemp.round()}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Mintemp: ${weatherModel.mintemp.round()}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          weatherModel.weathercondition,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
      ])),
    );
  }
}
