import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wfapp/Model/CityWeather.dart';
// import 'package:wfapp/Model/Weather.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);
  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  CityWeather? cityWeather;
  String? cityName;

  @override
  void initState() {
    super.initState();
    if (cityName == null){
      cityName = "London";
    }
    connectAPI();
  }

  // Connect to API
  void connectAPI() async {
    String apiKey = '841097aa103a32926ebbf1f717ef6b73';
    try {
      var response =
      await Dio().get("https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey");

      Map<String, dynamic> responseData = response.data;
      setState(() {
        cityWeather = CityWeather.fromJson(responseData);
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 40.2),
              color: Colors.blueGrey,
              child: Row(
                children: [
                  IconButton(onPressed: () {
                    connectAPI();
                  }, icon: Icon(Icons.search,color: Colors.white)),
                  Expanded(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            cityName = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Enter a city",
                          border: InputBorder.none,
                        ),
                      )
                  ),
                ],
              ),
            ),
            //End search city session
            Container(
              margin: EdgeInsets.only(bottom: 30.2),
              child: Column(
                children: [
                  if (cityWeather != null)
                     Text('${cityWeather!.name ?? ""}', style: const TextStyle(fontSize: 60, color: Colors.deepOrange, fontWeight: FontWeight.bold)),
                  Text('${cityWeather!.weather?[0].des ?? ""}', style: TextStyle(fontSize: 22.1, color: Colors.black26, fontWeight: FontWeight.bold),),
                ],
              ),
          ),
            //End city session
            Container(
              padding: const EdgeInsets.all(24.0),
              color: Colors.indigo,
              child: Row(
                children: [
                  //Image session
                  Column(
                    children: <Widget>[
                      if (cityWeather != null)
                        if (cityWeather!.weather?[0].main == "Clouds")
                          Image.asset('assets/heavycloud.png',height: 150, width: 150)
                        else if (cityWeather!.weather?[0].main == "Rain")
                          Image.asset('assets/heavyrain.png',height: 150, width: 150)
                        else if (cityWeather!.weather?[0].main == "Clear")
                          Image.asset('assets/clear.png',height: 150, width: 150)
                        else Text("None display")
                    ],

                  ),
                  Column(
                    children: [
                      Text('${cityWeather!.main?.temp}',style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),),
                      Row(
                        children: [
                          Container(
                            child: Text('Min: ${(cityWeather!.main?.tempMin)}', style: TextStyle(fontSize: 14.0, color: Colors.yellow, fontWeight: FontWeight.bold),),
                            margin: EdgeInsets.only(right: 12.0, left: 24.0),
                          ),
                          Container(
                            child: Text('Max: ${cityWeather!.main?.tempMax}', style: TextStyle(fontSize: 14.0, color: Colors.greenAccent, fontWeight: FontWeight.bold),),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ),
                      ],
                    )
              ),
        );
  }
}
