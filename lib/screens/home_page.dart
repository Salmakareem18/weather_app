import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_cubt_weather/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_cubt_weather/get_weather_states.dart';
import 'package:weather_app/screens/search_view.dart';
import 'package:weather_app/widgets/NO_weather.dart';
import 'package:weather_app/widgets/weather_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather App',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const SearchView();
                      },
                    ),
                  );
                },
                icon: const Icon(
                  Icons.search,
                ))
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is NoWeatherState) {
              return const NoWeather();
            } else if (state is WeatherLoadedState) {
              return WeatherInfo(
                weather: state.weatherModel,
              );
            } else {
              return const Text('Ooops there was an error');
            }
          },
        ));
  }
}
