class LocationModel {
  LocationModel({
    required this.region,
    required this.county,
  });

  final String region;
  final String county;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        region: json["region"],
        county: json["county"],
      );

  Map<String, dynamic> toJson() => {
        "region": region,
        "county": county,
      };
}
