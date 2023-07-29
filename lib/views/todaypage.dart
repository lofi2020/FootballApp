import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_football_app/models/constants.dart';
import 'package:flutter_football_app/models/fixturesDTO.dart';
import 'package:flutter_football_app/services/httpclient.dart';
import 'package:flutter_football_app/utils/datetime_util.dart';
import 'package:flutter_football_app/views/fixture_item.dart';

class TodayPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TodayPageState();
}

class TodayPageState extends State<TodayPage>
    with SingleTickerProviderStateMixin {
  late FixturesDTO? _fixturesDTO;

  int _currentIndex = 1;
  String _dateString =
      DateTimeUtil.getTodayDateString(Constants.FORMAT_DEFAULT_DATE);

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 3, initialIndex: _currentIndex, vsync: this);
    _tabController.addListener(_changeTab);
  }

  _fetchData() async {
    _fixturesDTO = (await HttpClient.loadFixturesByDate(_dateString))!;
    print("Results:" + _fixturesDTO!.results.toString());
    return _fixturesDTO;
  }

  _changeTab() {
    if (_currentIndex == _tabController.index) {
      return;
    }
    switch (_tabController.index) {
      case 0:
        _dateString =
            DateTimeUtil.getYesterdayDateString(Constants.FORMAT_DEFAULT_DATE);
        break;
      case 1:
        _dateString =
            DateTimeUtil.getTodayDateString(Constants.FORMAT_DEFAULT_DATE);
        break;
      case 2:
        _dateString =
            DateTimeUtil.getTomorrowDateString(Constants.FORMAT_DEFAULT_DATE);
        break;
    }
    setState(() {
      _currentIndex = _tabController.index;
      _fetchData();
    });
  }

  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Gestern'),
    Tab(text: 'Heute'),
    Tab(text: 'Morgen'),
  ];

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: tabs,
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: tabs.map((Tab tab) {
              return Container(
                  child: FutureBuilder(
                      future: _fetchData(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.connectionState == ConnectionState.none ||
                            !snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Container(
                              child: ListView.builder(
                                  itemCount: _fixturesDTO!.results,
                                  itemBuilder:
                                      (BuildContext context, int index) {
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
            }).toList(),
          ),
        );
      }),
    );
  }
}
