class Sys {
  num? type;
  num? id;
  String? country;
  num? sunrise;
  num? sunset;

  Sys({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset
  });

  Sys.fromJson(Map<String, dynamic>json):
        type = json['type'],
        id = json['id'],
        country = json['country'],
        sunrise = json['sunrise'],
        sunset = json['sunset'];
}