// To parse this JSON data, do
//
//     final fixtures = fixturesFromJson(jsonString);

import 'dart:convert';
import 'common.dart';

FixturesDTO fixturesFromJson(String str) =>
    FixturesDTO.fromJson(json.decode(str));

String fixturesToJson(FixturesDTO data) => json.encode(data.toJson());

class FixturesDTO {
  FixturesDTO({
    this.get,
    this.parameters,
    this.errors,
    required this.results,
    this.paging,
    this.response,
  });

  String? get;
  Map<String, dynamic>? parameters;
  List<dynamic>? errors;
  int results;
  Paging? paging;
  List<FixtureResponse>? response;

  factory FixturesDTO.fromJson(Map<String, dynamic> json) => FixturesDTO(
        get: json["get"],
        parameters: json["parameters"],
        errors: json["errors"],
        results: json["results"],
        paging: Paging.fromJson(json["paging"]),
        response: List<FixtureResponse>.from(
            json["response"].map((x) => FixtureResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "get": get,
        "parameters": jsonEncode(parameters),
        "errors": errors,
        "results": results,
        "paging": paging?.toJson(),
        "response": List<dynamic>.from(response!.map((x) => x.toJson())),
      };
}

class FixtureResponse {
  FixtureResponse({
    this.fixture,
    this.league,
    this.teams,
    this.goals,
    this.score,
  });

  Fixture? fixture;
  League? league;
  Teams? teams;
  Goals? goals;
  Score? score;

  factory FixtureResponse.fromJson(Map<String, dynamic> json) =>
      FixtureResponse(
        fixture: Fixture.fromJson(json["fixture"]),
        league: League.fromJson(json["league"]),
        teams: Teams.fromJson(json["teams"]),
        goals: Goals.fromJson(json["goals"]),
        score: Score.fromJson(json["score"]),
      );

  Map<String, dynamic> toJson() => {
        "fixture": fixture?.toJson(),
        "league": league?.toJson(),
        "teams": teams?.toJson(),
        "goals": goals?.toJson(),
        "score": score?.toJson(),
      };
}
