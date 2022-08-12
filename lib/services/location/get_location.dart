// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:http/http.dart' as http;

Future func() async {
  var headers = {
    'X-CSCAPI-KEY': 'VE4wV3VsU2hQSkJTRHNMZUlDTUM1NFg0RnZCbmRqUDFCcWE5bHpsdg=='
  };


  var request = http.Request(
      'GET', Uri.parse('https://api.countrystatecity.in/v1/states'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

funcs() async {
  var headers = {
    'X-CSCAPI-KEY': 'VE4wV3VsU2hQSkJTRHNMZUlDTUM1NFg0RnZCbmRqUDFCcWE5bHpsdg=='
  };

  var request = http.Request(
      'GET',
      Uri.parse(
          'https://api.countrystatecity.in/v1/countries/IN/states/MH/cities'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
