class Wind {
      num? speed;
      num? deg;
      num? gust;

      Wind({
        this.speed, this.deg, this.gust
      });

      Wind.fromJson(Map<String, dynamic>json):
            speed = json['speed'],
            deg = json['deg'],
            gust = json['gust'];
}