import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:sharethechurch/models/location/location_model.dart';
import 'package:sharethechurch/models/location/location_request.dart';

class LocationService {
  final Location _location = Location();

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

  Future<LocationRequest> getLocationName(LocationData data) async {
    try {
      http.Response response = await http.get(Uri.parse(
          'http://api.positionstack.com/v1/reverse?access_key=0386ef665d8ed3d906681af87bd4ba16&query=${data.latitude},${data.longitude}'));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body)['data'][0];
        LocationModel model = LocationModel.fromJson(result);
        return LocationRequest(status: true, model: model);
      } else {
        return LocationRequest(status: false);
      }
    } catch (e) {
      return LocationRequest(status: false);
    }
  }
}
