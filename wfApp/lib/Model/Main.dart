class Main{
  num? temp;
  num? feelLike;
  num? tempMin;
  num? tempMax;
  num? pressure;
  num? humidity;

  Main({
    this.temp, this.feelLike, this.tempMin, this.tempMax,this.pressure, this.humidity
  });

  Main.fromJson(Map<String, dynamic>json):
        temp = json['temp'],
        feelLike = json['feels_like'],
        tempMin = json['temp_min'],
        tempMax = json['temp_max'],
        pressure = json['pressure'],
        humidity = json['humidity'];
}