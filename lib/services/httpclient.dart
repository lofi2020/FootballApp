import 'dart:convert';

import 'package:flutter_football_app/models/constants.dart';
import 'package:flutter_football_app/models/fixturesDTO.dart';
import 'package:http/http.dart' as http;
import 'package:sprintf/sprintf.dart';

class HttpClient {
  static var headers = {
    'x-rapidapi-key': Constants.X_RAPIAPI_KEY,
    'x-rapidapi-host': Constants.X_RAPIAPI_HOST,
  };

  static printResult(String endpoint) async {
    var request =
        http.Request('GET', Uri.parse(Constants.X_FOOTBALL_API_URL + endpoint));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
    return response.statusCode;
  }

  static dynamic getResponse(String endpoint) async {
    var request =
        http.Request('GET', Uri.parse(Constants.X_FOOTBALL_API_URL + endpoint));
    request.headers.addAll(headers);
    var response = await request.send();
    return response;
  }

  static Future<FixturesDTO?> loadFixturesByDate(String dateString) async {
    final endpoint = Constants.ENDPOINT_FIXTURES_BY_DATE + dateString;
    var response = await HttpClient.getResponse(endpoint);
    if (response.statusCode == 200) {
      return FixturesDTO.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  static Future<FixturesDTO?> loadFixturesLiveAll() async {
    final endpoint = Constants.ENDPOINT_FIXTURES_LIVE_ALL;
    var response = await HttpClient.getResponse(endpoint);
    if (response.statusCode == 200) {
      return FixturesDTO.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
