//
// Common classes for for response of football api
//

class Paging {
  Paging({
    this.current,
    this.total,
  });

  int? current = 0;
  int? total = 0;

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        current: json["current"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current": current,
        "total": total,
      };
}

class Fixture {
  Fixture({
    this.id,
    this.referee,
    this.timezone,
    this.date,
    this.timestamp,
    this.periods,
    this.venue,
    this.status,
  });

  int? id;
  dynamic referee;
  String? timezone;
  DateTime? date;
  int? timestamp;
  Periods? periods;
  Venue? venue;
  Status? status;

  factory Fixture.fromJson(Map<String, dynamic> json) => Fixture(
        id: json["id"],
        referee: json["referee"],
        timezone: json["timezone"],
        date: DateTime.parse(json["date"]),
        timestamp: json["timestamp"],
        periods: Periods.fromJson(json["periods"]),
        venue: Venue.fromJson(json["venue"]),
        status: Status.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "referee": referee,
        "timezone": timezone,
        "date": date?.toIso8601String(),
        "timestamp": timestamp,
        "periods": periods?.toJson(),
        "venue": venue?.toJson(),
        "status": status?.toJson(),
      };
}

class Periods {
  Periods({
    this.first,
    this.second,
  });

  int? first;
  int? second;

  factory Periods.fromJson(Map<String, dynamic> json) => Periods(
        first: json["first"],
        second: json["second"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "second": second,
      };
}

class Status {
  Status({
    this.long,
    this.short,
    this.elapsed,
  });

  String? long;
  String? short;
  dynamic elapsed;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        long: json["long"],
        short: json["short"],
        elapsed: json["elapsed"],
      );

  Map<String, dynamic> toJson() => {
        "long": long,
        "short": short,
        "elapsed": elapsed,
      };
}

class Venue {
  Venue({
    this.id,
    this.name,
    this.city,
  });

  int? id;
  String? name;
  String? city;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["id"],
        name: json["name"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
      };
}

class Goals {
  Goals({
    required this.home,
    required this.away,
  });

  int? home;
  int? away;

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        home: json["home"],
        away: json["away"],
      );

  Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
      };
}

class Teams {
  Teams({
    required this.home,
    required this.away,
  });

  Team? home;
  Team? away;

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        home: json["home"] == null ? null : Team.fromJson(json["home"]),
        away: json["away"] == null ? null : Team.fromJson(json["away"]),
      );

  Map<String, dynamic> toJson() => {
        "home": home!.toJson(),
        "away": away!.toJson(),
      };
}

class Team {
  Team({
    this.id,
    this.name,
    this.logo,
    this.winner,
  });

  int? id;
  String? name;
  String? logo;
  dynamic winner;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        winner: json["winner"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "winner": winner,
      };
}

class League {
  League({
    this.id,
    this.name,
    this.country,
    this.logo,
    this.flag,
    this.season,
    this.round,
  });

  int? id;
  String? name;
  String? country;
  String? logo;
  String? flag;
  int? season;
  String? round;

  factory League.fromJson(Map<String, dynamic> json) => League(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        logo: json["logo"],
        flag: json["flag"],
        season: json["season"],
        round: json["round"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "logo": logo,
        "flag": flag,
        "season": season,
        "round": round,
      };
}

class Score {
  Score({
    this.halftime,
    this.fulltime,
    this.extratime,
    this.penalty,
  });

  Goals? halftime;
  Goals? fulltime;
  Goals? extratime;
  Goals? penalty;

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        halftime: Goals.fromJson(json["halftime"]),
        fulltime: Goals.fromJson(json["fulltime"]),
        extratime: Goals.fromJson(json["extratime"]),
        penalty: Goals.fromJson(json["penalty"]),
      );

  Map<String, dynamic> toJson() => {
        "halftime": halftime!.toJson(),
        "fulltime": fulltime!.toJson(),
        "extratime": extratime!.toJson(),
        "penalty": penalty!.toJson(),
      };
}

class Country {
  Country({
    this.name,
    this.code,
    this.flag,
  });

  String? name;
  String? code;
  String? flag;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        code: json["code"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "flag": flag,
      };
}

class Season {
  Season({
    this.year,
    this.start,
    this.end,
    this.current,
    this.coverage,
  });

  int? year;
  DateTime? start;
  DateTime? end;
  bool? current;
  Coverage? coverage;

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        year: json["year"] == null ? null : json["year"],
        start: json["start"] == null ? null : DateTime.parse(json["start"]),
        end: json["end"] == null ? null : DateTime.parse(json["end"]),
        current: json["current"] == null ? null : json["current"],
        coverage: json["coverage"] == null
            ? null
            : Coverage.fromJson(json["coverage"]),
      );

  Map<String, dynamic> toJson() => {
        "year": year == null ? null : year,
        "start": start == null
            ? null
            : "${start!.year.toString().padLeft(4, '0')}-${start!.month.toString().padLeft(2, '0')}-${start!.day.toString().padLeft(2, '0')}",
        "end": end == null
            ? null
            : "${end!.year.toString().padLeft(4, '0')}-${end!.month.toString().padLeft(2, '0')}-${end!.day.toString().padLeft(2, '0')}",
        "current": current == null ? null : current,
        "coverage": coverage == null ? null : coverage!.toJson(),
      };
}

class Coverage {
  Coverage({
    this.fixtures,
    this.standings,
    this.players,
    this.topScorers,
    this.topAssists,
    this.topCards,
    this.injuries,
    this.predictions,
    this.odds,
  });

  Fixtures? fixtures;
  bool? standings;
  bool? players;
  bool? topScorers;
  bool? topAssists;
  bool? topCards;
  bool? injuries;
  bool? predictions;
  bool? odds;

  factory Coverage.fromJson(Map<String, dynamic> json) => Coverage(
        fixtures: Fixtures.fromJson(json["fixtures"]),
        standings: json["standings"],
        players: json["players"],
        topScorers: json["top_scorers"],
        topAssists: json["top_assists"],
        topCards: json["top_cards"],
        injuries: json["injuries"],
        predictions: json["predictions"],
        odds: json["odds"],
      );

  Map<String, dynamic> toJson() => {
        "fixtures": fixtures,
        "standings": standings,
        "players": players,
        "top_scorers": topScorers,
        "top_assists": topAssists,
        "top_cards": topCards,
        "injuries": injuries,
        "predictions": predictions,
        "odds": odds,
      };
}

class Fixtures {
  Fixtures({
    this.events,
    this.lineups,
    this.statisticsFixtures,
    this.statisticsPlayers,
  });

  bool? events;
  bool? lineups;
  bool? statisticsFixtures;
  bool? statisticsPlayers;

  factory Fixtures.fromJson(Map<String, dynamic> json) => Fixtures(
        events: json["events"] == null ? null : json["events"],
        lineups: json["lineups"] == null ? null : json["lineups"],
        statisticsFixtures: json["statistics_fixtures"] == null
            ? null
            : json["statistics_fixtures"],
        statisticsPlayers: json["statistics_players"] == null
            ? null
            : json["statistics_players"],
      );

  Map<String, dynamic> toJson() => {
        "events": events == null ? null : events,
        "lineups": lineups == null ? null : lineups,
        "statistics_fixtures":
            statisticsFixtures == null ? null : statisticsFixtures,
        "statistics_players":
            statisticsPlayers == null ? null : statisticsPlayers,
      };
}
