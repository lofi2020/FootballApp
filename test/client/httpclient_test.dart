import 'dart:convert';

import 'package:flutter_football_app/models/constants.dart';
import 'package:flutter_football_app/models/fixturesDTO.dart';
import 'package:flutter_football_app/models/leaguesDTO.dart';
import 'package:flutter_football_app/services/httpclient.dart';
import 'package:flutter_football_app/utils/datetime_util.dart';
import 'package:test/test.dart';

void main() {
  test('Request with country code DE', () async {
    final endpoint = "/v3/countries?code=DE";
    var response = await HttpClient.getResponse(endpoint);
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
    expect(response.statusCode, 200);
  });
  test('Request with leagues', () async {
    final endpoint = "/v3/leagues?code=DE";
    var response = await HttpClient.getResponse(endpoint);

    if (response.statusCode == 200) {
      var jsonString = await response.stream.bytesToString();
      var leagueDTO = LeaguesDTO.fromJson(jsonDecode(jsonString));
      print(leagueDTO.leaguesGet);
      print(leagueDTO.parameters!['code']);
    } else {
      print(response.reasonPhrase);
    }
    expect(response.statusCode, 200);
  });

  test('Request with Fixtures', () async {
    final endpoint = "/v3/fixtures?live=all";
    var response = await HttpClient.getResponse(endpoint);
    if (response.statusCode == 200) {
      var jsonString = await response.stream.bytesToString();
      print(jsonString);
      var fixturesDTO = FixturesDTO.fromJson(jsonDecode(jsonString));
      print(fixturesDTO.get);
      print(fixturesDTO.parameters!['season']);
    } else {
      print(response.reasonPhrase);
    }
    expect(response.statusCode, 200);
  });

  test('Request with LoadFixturesLiveAll', () async {
    FixturesDTO? response = await HttpClient.loadFixturesLiveAll();
    print("List<FixtureResponse> :" + response!.results.toString());
  });

  test('Request with LoadFixturesByDay', () async {
    var yesterdayString =
        DateTimeUtil.getTodayDateString(Constants.FORMAT_DEFAULT_DATE);
    print("Yesterday: " + yesterdayString);
    FixturesDTO? response =
        await HttpClient.loadFixturesByDate(yesterdayString);
    print("List<FixtureResponse> :" + response!.toString());
    expect(response.errors!.length == 0, true);
  });
}
