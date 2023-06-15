import 'package:wfapp/Model/Coor.dart';
import 'package:wfapp/Model/Main.dart';
import 'package:wfapp/Model/Sys.dart';
import 'package:wfapp/Model/Weather.dart';
import 'package:wfapp/Model/clouds.dart';
import 'package:wfapp/Model/Wind.dart';
class CityWeather{
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  num? visibility;
  Wind? wind;
  Clouds? clouds;
  num? dt;
  Sys? sys;
  num? timezone;
  num? id;
  String? name;
  num? cod;

  CityWeather({
    this.coord, this.weather, this.base, this.main,
    this.visibility,this.wind,this.clouds, this.dt,this.sys
    , this.timezone, this.id,
    this.name, this.cod
  });

  CityWeather.fromJson(Map<String , dynamic>json){
    coord = Coord.fromJson(json['coord']);
    weather = (json['weather'] as List<dynamic>)
        .map((item) => Weather.fromJson(item))
        .toList();
    base = json['base'];
    main = Main.fromJson(json['main']);
    visibility = json['visibility'];
    wind = Wind.fromJson(json['wind']);
    clouds = Clouds.fromJson(json['clouds']);
    dt = json['dt'];
    sys = Sys.fromJson(json['sys']);
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

}