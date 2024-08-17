class WeatherModel {
  final String namecity;
  final DateTime date;
  final String image;
  final double temp;
  final double mintemp;
  final double maxtemp;
  final String weathercondition;

  WeatherModel(
      {required this.namecity,
      required this.date,
      required this.image,
      required this.temp,
      required this.mintemp,
      required this.maxtemp,
      required this.weathercondition});
  factory WeatherModel.fromJason(json) {
    //عملنا نيمد كونست نوعه فاكتور عشان ترجعلي اوبجكت بياناته جيالي من الانترنت
    return WeatherModel(
      namecity: json['location']['name'],
      date: DateTime.parse(
        json['current']['last_updated'],
      ),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      weathercondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
