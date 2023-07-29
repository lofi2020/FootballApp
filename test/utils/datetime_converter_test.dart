import 'package:flutter_football_app/models/constants.dart';
import 'package:flutter_football_app/utils/datetime_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('formatDateTime', () {
    var now = DateTime.now();
    var timeString =
        DateTimeUtil.formatDateTime(now, Constants.FORMAT_TIME_HOUR_MINUTE);
    print("Time: " + timeString);
    expect(timeString != null, true);
  });

  test('getYesterdayDateString', () {
    var dateTimeString =
        DateTimeUtil.getYesterdayDateString(Constants.FORMAT_DEFAULT_DATE);
    print("Time: " + dateTimeString);
    expect(dateTimeString != null, true);
  });

  test('formatTimestamp', () {
    var nowSeconds = DateTime.now().millisecondsSinceEpoch;
    var timeString = DateTimeUtil.formatTimestamp(
        nowSeconds, Constants.FORMAT_TIME_HOUR_MINUTE);
    print("Time: " + timeString);
    expect(timeString != null, true);
  });
}
