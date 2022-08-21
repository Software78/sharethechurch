import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:sharethechurch/models/location/location_model.dart';
import 'package:sharethechurch/models/location/location_request.dart';

class LocationService {
  final Location _location = Location();
  late LocationRequest _request;

  LocationRequest get request => _request;

  Future<LocationData?> getLocation() async {
    late LocationData data;
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      _location.requestService();
    }
    PermissionStatus permissionStatus = await _location.requestPermission();
    if (permissionStatus == PermissionStatus.granted) {
      data = await _location.getLocation();
      return data;
    }
    return null;
  }

  getLocationName(LocationData data) async {
    try {
      http.Response response = await http.get(Uri.parse(
          'http://api.positionstack.com/v1/reverse?access_key=0386ef665d8ed3d906681af87bd4ba16&query=${data.latitude},${data.longitude}'));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body)['data'][0];
        LocationModel model = LocationModel.fromJson(result);
        _request = LocationRequest(status: true, model: model);
      } else {
        _request = LocationRequest(status: false);
      }
    } catch (e) {
      _request = LocationRequest(status: false);
    }
  }
}

class LocationManager {
  final LocationService _service = LocationService();

  Future<LocationRequest> getLocation() async {
    LocationData? locationData = await _service.getLocation();
    LocationRequest request = await _service.getLocationName(locationData!);
    return request;
  }
}
