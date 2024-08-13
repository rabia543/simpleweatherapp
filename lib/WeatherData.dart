class Weatherdata {
  final double temp;
  final int humidity;
  final double feelsLike;
  final int clouds;
  final String main;
  final String description;

  Weatherdata({
    required this.temp,
    required this.humidity,
    required this.feelsLike,
    required this.clouds,
    required this.main,
    required this.description,
  });

  factory Weatherdata.fromJson(Map<String, dynamic> json) {
    return Weatherdata(
      temp: json['main']['temp'].toDouble(),
      humidity: json['main']['humidity'],
      feelsLike: json['main']['feels_like'].toDouble(),
      clouds: json['clouds']['all'],
      main: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
    );
  }
}
