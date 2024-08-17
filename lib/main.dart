import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_cubt_weather/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_cubt_weather/get_weather_states.dart';
import 'package:weather_app/screens/home_page.dart';

void main() {
  runApp(const Weatherapp());
}

class Weatherapp extends StatelessWidget {
  const Weatherapp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: Builder(
          builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  appBarTheme: AppBarTheme(
                    backgroundColor: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weathercondition,
                    ),
                  ),

                  // ديما بيحصل تعديل ف فلاتر ف primarySwatch لما انا جربتها عندي مشتغلتش بردوا ف شفت اي الويدجت المسوله عن الابك جراوند للتطبيق كله وحطيت قصدها الكود
                  // primarySwatch: getThemeColor(
                  //   BlocProvider.of<GetWeatherCubit>(context)
                  //       .weatherModel
                  //       ?.weathercondition,
                  // ),
                ),
                debugShowCheckedModeBanner: false,
                home: const HomePage(),
              );
            },
          ),
        ));
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == 'Sunny') {
    return Colors.orange; // Represents a sunny day
  } else if (condition == 'Clear') {
    return Colors.blue; // Represents clear skies
  } else if (condition == 'Partly cloudy') {
    return Colors.grey; // Represents partly cloudy skies
  } else if (condition == 'Cloudy') {
    return Colors.blueGrey; // Represents cloudy skies
  } else if (condition == 'Overcast') {
    return Colors.blueGrey; // Represents overcast skies
  } else if (condition == 'Mist') {
    return Colors.grey; // Represents misty weather
    // Represents patchy rain possible
  } else if (condition == 'Patchy snow possible') {
    return Colors.lightBlue; // Represents patchy snow possible
  } else if (condition == 'Patchy sleet possible') {
    return Colors.blueGrey; // Represents patchy sleet possible
  } else if (condition == 'Patchy freezing drizzle possible') {
    return Colors.grey; // Represents patchy freezing drizzle possible
  } else if (condition == 'Thundery outbreaks possible') {
    return Colors.deepPurple; // Represents thundery outbreaks possible
    // Represents blowing snow
  } else if (condition == 'Fog') {
    return Colors.grey; // Represents fog
  } else if (condition == 'Freezing fog') {
    return Colors.grey; // Represents freezing fog
  } else if (condition == 'Patchy light drizzle') {
    return Colors.grey; // Represents patchy light drizzle
  } else if (condition == 'Light drizzle') {
    return Colors.grey; // Represents light drizzle
  } else if (condition == 'Freezing drizzle') {
    return Colors.grey; // Represents freezing drizzle
  } else if (condition == 'Heavy freezing drizzle') {
    return Colors.grey; // Represents heavy freezing drizzle
  } else if (condition == 'Patchy light rain') {
    return Colors.blue; // Represents patchy light rain
  } else if (condition == 'Light rain') {
    return Colors.blue; // Represents light rain
  } else if (condition == 'Moderate rain at times') {
    return Colors.blue; // Represents moderate rain at times
  } else if (condition == 'Moderate rain') {
    return Colors.blue; // Represents moderate rain
  } else if (condition == 'Heavy rain at times') {
    return Colors.blue; // Represents heavy rain at times
  } else if (condition == 'Heavy rain') {
    return Colors.blue; // Represents heavy rain
  } else if (condition == 'Light freezing rain') {
    return Colors.blueGrey; // Represents light freezing rain
  } else if (condition == 'Moderate or heavy freezing rain') {
    return Colors.blueGrey; // Represents moderate or heavy freezing rain
  } else if (condition == 'Light sleet') {
    return Colors.blueGrey; // Represents light sleet
  } else if (condition == 'Moderate or heavy sleet') {
    return Colors.blueGrey; // Represents moderate or heavy sleet
  } else if (condition == 'Patchy light snow') {
    return Colors.lightBlue; // Represents patchy light snow
  } else if (condition == 'Light snow') {
    return Colors.lightBlue; // Represents light snow
  } else if (condition == 'Patchy moderate snow') {
    return Colors.lightBlue; // Represents patchy moderate snow
  } else if (condition == 'Moderate snow') {
    return Colors.lightBlue; // Represents moderate snow
  } else if (condition == 'Patchy heavy snow') {
    return Colors.lightBlue; // Represents patchy heavy snow
  } else if (condition == 'Heavy snow') {
    return Colors.lightBlue; // Represents heavy snow
  } else if (condition == 'Ice pellets') {
    return Colors.blueGrey; // Represents ice pellets
  } else if (condition == 'Light rain shower') {
    return Colors.blue; // Represents light rain shower
  } else if (condition == 'Moderate or heavy rain shower') {
    return Colors.blue; // Represents moderate or heavy rain shower
  } else if (condition == 'Torrential rain shower') {
    return Colors.blue; // Represents torrential rain shower
  } else if (condition == 'Light sleet showers') {
    return Colors.blueGrey; // Represents light sleet showers
  } else if (condition == 'Moderate or heavy sleet showers') {
    return Colors.blueGrey; // Represents moderate or heavy sleet showers
  } else if (condition == 'Light snow showers') {
    return Colors.lightBlue; // Represents light snow showers
  } else if (condition == 'Moderate or heavy snow showers') {
    return Colors.lightBlue; // Represents moderate or heavy snow showers
  } else if (condition == 'Light showers of ice pellets') {
    return Colors.blueGrey; // Represents light showers of ice pellets
  } else if (condition == 'Moderate or heavy showers of ice pellets') {
    return Colors
        .blueGrey; // Represents moderate or heavy showers of ice pellets
  } else if (condition == 'Patchy light rain with thunder') {
    return Colors.deepPurple; // Represents patchy light rain with thunder
  } else if (condition == 'Moderate or heavy rain with thunder') {
    return Colors.deepPurple; // Represents moderate or heavy rain with thunder
  } else if (condition == 'Patchy light snow with thunder') {
    return Colors.deepPurple; // Represents patchy light snow with thunder
  } else if (condition == 'Moderate or heavy snow with thunder') {
    return Colors.deepPurple; // Represents moderate or heavy snow with thunder
  } else {
    return Colors.grey; // Default color for unknown conditions
  }
}
