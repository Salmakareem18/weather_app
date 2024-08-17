import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl =
      'api.weatherapi.com/v1'; //لان بعدين ممكن محتوى ال api دا يتغير ف انا عملته كمتغير عشان مفضل اروح اغيره ف كل مكان انا استخدمته فيه
  final String apiKey = '784ff7c3d5054e2c8b9155720241408';
  WeatherServices({required this.dio});
  Future<WeatherModel> getcurrentweather({required String cityName}) async {
    //دي الميثود ال هتجعلي weathermodel
    //انا بعمل هنا ريكويست ف اكيد هيجيلي ف المستقبل ف هعمل فيوتشر
    try {
      Response response = await dio
          .get('http://$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      // بجيب الريسبونس باخد منها الداتا
      //وتبعتها ل الويذر مودل فروم جتسون يبنيلي الاوبجيت
      // واخزنه ف الويذر مودل وبعد كان يرجعهالي

      WeatherModel weatherModel = WeatherModel.fromJason(response.data);
      return weatherModel;
      //ف حالة اكسبشن من dio
    } on DioException catch (e) {
      final String errormessage = e.response?.data['error']['message'] ??
          'Oops there was an error,Try later';
//لو ع الشمال دا جه بnullهيطلع الجمله ال ع اليمين
      throw Exception(errormessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops there was an error,Try later');
    }
  }
}
