import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_football_app/models/constants.dart';
import 'package:flutter_football_app/models/fixturesDTO.dart';
import 'package:flutter_football_app/utils/datetime_util.dart';

// ignore: must_be_immutable
class FixtureItem extends StatefulWidget {
  late FixtureResponse _fixtureResponse;

  FixtureItem(FixtureResponse fixtureResponse) {
    _fixtureResponse = fixtureResponse;
  }

  @override
  State<StatefulWidget> createState() => FixtureWidgetState(_fixtureResponse);
}

class FixtureWidgetState extends State<FixtureItem> {
  late FixtureResponse _fixtureResponse;

  FixtureWidgetState(FixtureResponse fixtureResponse) {
    _fixtureResponse = fixtureResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 40,
          alignment: Alignment.center,
          child: Center(
              child: Text(DateTimeUtil.formatDateTime(
                  _fixtureResponse.fixture!.date!,
                  Constants.FORMAT_TIME_HOUR_MINUTE))),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 150,
                  height: 40,
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        child: Container(
                            child: Text(_fixtureResponse.teams!.home!.name!)),
                      ),
                      SizedBox(width: 10),
                      CachedNetworkImage(
                          imageUrl: _fixtureResponse.teams!.home!.logo!,
                          width: 20,
                          fit: BoxFit.fitWidth),
                    ],
                  )),
              Container(
                width: 60,
                height: 40,
                child: Center(
                    child: _fixtureResponse.goals!.home != null
                        ? Text(_fixtureResponse.goals!.home!.toString() +
                            " : " +
                            _fixtureResponse.goals!.away.toString())
                        : Text("- : -")),
              ),
              Container(
                width: 150,
                height: 40,
                child: Row(
                  children: [
                    CachedNetworkImage(
                        imageUrl: _fixtureResponse.teams!.away!.logo!,
                        width: 20,
                        fit: BoxFit.fitWidth),
                    SizedBox(width: 10),
                    Container(
                      alignment: Alignment.centerRight,
                      width: 120,
                      child: Container(
                          child: Text(
                        _fixtureResponse.teams!.away!.name!,
                        textAlign: TextAlign.right,
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
