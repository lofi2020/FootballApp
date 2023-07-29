import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_football_app/models/constants.dart';
import 'package:flutter_football_app/models/fixturesDTO.dart';
import 'package:flutter_football_app/services/httpclient.dart';
import 'package:flutter_football_app/utils/datetime_util.dart';
import 'package:flutter_football_app/views/fixture_item.dart';

class FixturesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FixturesPageState();
}

class FixturesPageState extends State<FixturesPage> {
  late FixturesDTO? _fixturesDTO;

  _fetchData() async {
    _fixturesDTO = (await HttpClient.loadFixturesByDate(
        DateTimeUtil.getTodayDateString(Constants.FORMAT_DEFAULT_DATE)))!;
    print("Results:" + _fixturesDTO!.results.toString());
    return _fixturesDTO;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
            future: _fetchData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.none ||
                  !snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Container(
                    child: ListView.builder(
                        itemCount: _fixturesDTO!.results,
                        itemBuilder: (BuildContext context, int index) {
                          var item = _fixturesDTO!.response![index];
                          if (_fixturesDTO == null ||
                              _fixturesDTO!.response == null) {
                            return Center(child: Text("Item"));
                          } else {
                            return FixtureItem(item);
                          }
                        }));
              }
            }));
  }
}
