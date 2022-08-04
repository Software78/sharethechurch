// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sharethechurch/models/city_model.dart';

import '../../models/state_model.dart';

class LocationService {
  final String _HEADER_API_KEY = 'X-CSCAPI-KEY';

  final String _HEADER_API_KEY_VALUE =
      'VE4wV3VsU2hQSkJTRHNMZUlDTUM1NFg0RnZCbmRqUDFCcWE5bHpsdg==';

  final String _url = 'https://api.countrystatecity.in/v1/countries/US/states';

  Future<List?> getStates() async {
    var headers = {_HEADER_API_KEY: _HEADER_API_KEY_VALUE};
    var response = await http.get(Uri.parse(_url),
        headers: {_HEADER_API_KEY: _HEADER_API_KEY_VALUE});
    if (response.statusCode == 200) {
      var results = jsonDecode(response.body);
      List finalResults = results.map((e) => States.fromJson(e)).toList();
      return finalResults;
    } else {
      return null;
    }
  }

  Future<List<City>> getCities(String state) async {
    List<City> cities = [];
    var headers = {_HEADER_API_KEY: _HEADER_API_KEY_VALUE};
    var response = await http.get(Uri.parse('$_url/$state/cities'),
        headers: {_HEADER_API_KEY: _HEADER_API_KEY_VALUE});
    if (response.statusCode == 200) {
      var results = jsonDecode(response.body) as List;
      cities = results.map((e) => City.fromJson(e)).toList();
    }

    return cities;
  }
}
