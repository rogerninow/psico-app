import 'package:intl/intl.dart';
import 'package:timezone/standalone.dart' as tz;

final timezone = tz.getLocation('America/Toronto');

bool hasValue(value) {
  return !["", 'null', 'false', '0'].contains(value.toString());
}

String getString(value) {
  return hasValue(value) ? value.toString() : '';
}

int getInt(value) {
  return hasValue(value) ? int.parse(value.toString()) : 0;
}

double getDouble(value) {
  return hasValue(value) ? double.parse(value.toString()) : 0;
}

bool getBool(value) {
  return hasValue(value) && value == 'true' ? true : false;
}


String getFormattedDate(String stringDate) {
  DateTime dateTime = DateTime.parse(stringDate);
  final localized = tz.TZDateTime.from(dateTime, timezone);

  return DateFormat('yyyy-MM-dd hh:mm').format(localized);
}

DateTime getDatetimeFromString(String stringDate) {
  DateTime date;

  try {
    date = DateFormat("yyyy-MM-d HH:mm").parse(stringDate);
  } catch (exception) {
    date = DateFormat("yyyy-MM-d HH:mm").parse(stringDate);
  }

  return date;
}