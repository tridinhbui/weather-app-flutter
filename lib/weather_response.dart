class WeatherResponse {
  final CoordEntity? coordEntity;
  final List<WeatherEntity>? weatherEntity;
  final MainEntity? mainEntity;

  WeatherResponse({
    this.coordEntity,
    this.weatherEntity,
    this.mainEntity,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final list = json["weather"] as List;
    List<WeatherEntity> lsWeathers = [];
    for (var element in list) {
      lsWeathers.add(WeatherEntity.fromJson(element));
    }
    return WeatherResponse(
      coordEntity: CoordEntity.fromJson(json["coord"]),
      mainEntity: MainEntity.fromJson(json["main"]),
      weatherEntity: lsWeathers,
    );
  }
}

class CoordEntity {
  final double? lat;
  final double? long;

  CoordEntity({
    this.lat,
    this.long,
  });

  factory CoordEntity.fromJson(Map<String, dynamic> json) {
    return CoordEntity(
      lat: json["lat"],
      long: json["lon"],
    );
  }
}

class MainEntity {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;
  final int? seaLevel;
  final int? grndLevel;

  MainEntity({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  factory MainEntity.fromJson(Map<String, dynamic> json) {
    return MainEntity(
      temp: json["temp"],
      tempMin: json["temp_min"],
      tempMax: json["temp_max"],
      pressure: json["pressure"],
      humidity: json["humidity"],
      seaLevel: json["grnd_level"],
    );
  }
}

class WeatherEntity {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  WeatherEntity({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherEntity.fromJson(Map<String, dynamic> json) {
    return WeatherEntity(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"]);
  }
}
