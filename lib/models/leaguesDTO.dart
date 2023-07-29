// To parse this JSON data, do
//
//     final leagues = leaguesFromJson(jsonString);

import 'dart:convert';

import 'common.dart';

LeaguesDTO leaguesFromJson(String str) => LeaguesDTO.fromJson(json.decode(str));

String leaguesToJson(LeaguesDTO data) => json.encode(data.toJson());

class LeaguesDTO {
  LeaguesDTO({
    this.leaguesGet,
    this.parameters,
    this.errors,
    this.results,
    this.paging,
    this.response,
  });

  String? leaguesGet;
  Map<String, dynamic>? parameters;
  List<dynamic>? errors;
  int? results;
  Paging? paging;
  List<LeagueResponse>? response;

  factory LeaguesDTO.fromJson(Map<String, dynamic> json) => LeaguesDTO(
        leaguesGet: json["get"],
        parameters: json["parameters"],
        errors: json["errors"],
        results: json["results"],
        paging: Paging.fromJson(json["paging"]),
        response: List<LeagueResponse>.from(
            json["response"].map((x) => LeagueResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "get": leaguesGet == null ? null : leaguesGet,
        "parameters": jsonEncode(parameters),
        "errors": List<dynamic>.from(errors!.map((x) => x)),
        "results": results,
        "paging": paging!.toJson(),
        "response": List<LeagueResponse>.from(response!.map((x) => x.toJson())),
      };
}

class LeagueResponse {
  LeagueResponse({
    this.league,
    this.country,
    this.seasons,
  });

  League? league;
  Country? country;
  List<Season>? seasons;

  factory LeagueResponse.fromJson(Map<String, dynamic> json) => LeagueResponse(
        league: League.fromJson(json["league"]),
        country: Country.fromJson(json["country"]),
        seasons:
            List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "league": league!.toJson(),
        "country": country!.toJson(),
        "seasons": List<dynamic>.from(seasons!.map((x) => x.toJson())),
      };
}
