import 'package:flutter/material.dart';
import 'package:wfapp/modules/home_controller.dart';
import 'package:get/get.dart';

class MainHome extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

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
                  IconButton(
                    onPressed: () {
                      controller.connectAPI();
                    },
                    icon: const Icon(Icons.search, color: Colors.white),
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        controller.cityName!.value = value;
                      },
                      decoration: const InputDecoration(
                        hintText: "Enter a city",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // End search city session
            Obx(() => Container(
              margin: const EdgeInsets.only(bottom: 30.2),
              child: Column(
                children: [
                  if (controller.cityWeather.value != null)
                    Text(
                      '${controller.cityWeather.value!.name}',
                      style: const TextStyle(
                          fontSize: 60,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                    ),
                  Text(
                    '${controller.cityWeather.value?.weather?[0].des}',
                    style: const TextStyle(
                        fontSize: 22.1,
                        color: Colors.black26,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )),
            // End city session
            Obx(() => Container(
              padding: const EdgeInsets.all(24.0),
              color: Colors.indigo,
              child: Row(
                children: [
                  // Text('${controller.cityWeather.value?.weather?[0].des}'),
                  if (controller.cityWeather.value != null)
                    // Text('${controller.cityWeather.value?.weather?[0].main}'),
                    if (controller.cityWeather.value?.weather?[0].main == "Clouds")
                      Image.asset(
                        "assets/heavycloud.png",
                        width: 150,
                        height: 150,
                      )
                    else if (controller.cityWeather.value?.weather?[0].main == "Rain")
                      Image.asset(
                        "assets/heavyrain.png",
                        width: 150,
                        height: 150,
                      )
                    else if (controller.cityWeather.value?.weather?[0].main == "Clear")
                        Image.asset(
                          "assets/clear.png",
                          width: 150,
                          height: 150,
                        ),
                      // else
                      //   Text("None display"),
                  Column(
                    children: [
                      Obx(() => Text(
                        '${controller.convertKelvinToCelsius(controller.cityWeather.value?.main?.temp)}°C',
                        style: const TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 12.0, left: 24.0),
                            child: Obx(() => Text(
                              'Min: ${controller.convertKelvinToCelsius(controller.cityWeather.value?.main?.tempMin)}°C',
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                          Obx(() => Text(
                            'Max: ${controller.convertKelvinToCelsius(controller.cityWeather.value?.main?.tempMax)}°C',
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            )],
        ),
      ),
    );
  }
}
