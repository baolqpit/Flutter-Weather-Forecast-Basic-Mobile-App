class Clouds{
  num? all;

  Clouds({
    this.all
  });

  Clouds.fromJson(Map<String, dynamic>json):
      all = json['all'];
}