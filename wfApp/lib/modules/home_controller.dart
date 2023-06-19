import 'package:get/get.dart';
import 'package:wfapp/Model/CityWeather.dart';
import 'package:dio/dio.dart';

class HomeController extends GetxController{
  Rx<CityWeather?> cityWeather = Rx<CityWeather?>(null);
  RxString? cityName = ''.obs;

  @override
  void onInit(){
    super.onInit();
    if (cityName == '') {
      cityName = "London".obs;
    }
    connectAPI();
  }


  //Connect API
  void connectAPI() async {
    String apiKey = '841097aa103a32926ebbf1f717ef6b73';
    try {
      var response =
      await Dio().get("https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey");

      Map<String, dynamic> responseData = response.data;

      cityWeather.value = CityWeather.fromJson(responseData);

    } catch (error) {
      print('Error: $error');
    }
  }

  //Convert
  num convertKelvinToCelsius(num? kelvin) {
    if (kelvin != null) {
      num celsius = kelvin - 273.15;
      return num.parse(celsius.toStringAsFixed(1));
    }
    return 0.0;
  }
}