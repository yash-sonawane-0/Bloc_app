class Weather {
  final String cityName;
  final double temperatureCelsius;

  Weather({
    required this.cityName,
    required this.temperatureCelsius,
  });

  @override
  // ignore: avoid_renaming_method_parameters
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Weather &&
        o.cityName == cityName &&
        o.temperatureCelsius == temperatureCelsius;
  }

  @override
  int get hashCode => cityName.hashCode ^ temperatureCelsius.hashCode;
}
