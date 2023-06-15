class Weather {
  num? id;
  String? main;
  String? des;
  String? icon;


  Weather({
    this.id,
    this.main,
    this.des,
    this.icon
});

  Weather.fromJson(Map<String, dynamic>json):
      id = json['id'],
      main = json['main'],
      des = json['description'],
      icon = json['icon'];
}