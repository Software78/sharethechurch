import 'package:sharethechurch/models/location/location_model.dart';

class LocationRequest {
  String? message;
  bool status;
  LocationModel? model;

  LocationRequest({
    this.message,
    this.model,
    required this.status,
  });
}
