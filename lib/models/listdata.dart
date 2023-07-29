class PageData {
  String title = "";
  int itemCount = 0;
  List<ListData> lists = [];
}

class ListData {
  String title = "";
  int itemCount = 0;
  List<Section> sections = [];
}

class Section {
  String title = "";
  int itemCount = 0;
  List<dynamic> items = [];
}
