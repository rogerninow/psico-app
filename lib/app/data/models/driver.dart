import 'package:flutter/cupertino.dart';

class DriverModel with ChangeNotifier {
  String? driverCode;
  String? dwrCode;
  String? phoneNumber;
  String? token;
  String? deviceInformation;
  String? deviceId;
  String? langCode;

  DriverModel({
    this.driverCode,
    this.dwrCode,
    this.phoneNumber,
    this.token,
    this.deviceInformation,
    this.deviceId,
    this.langCode
  });

  set setPhoneNumber(String? newPhoneNumber) {
    phoneNumber = newPhoneNumber;
  }

  Future<bool> updateDriver(newDriverCode, newDwrCode, newPhoneNumber) async {
    driverCode  = newDriverCode.toString().toUpperCase();
    dwrCode     = newDwrCode;
    phoneNumber = newPhoneNumber;
    token       = phoneNumber;

    return Future.value(true);
  }

  Map<String, Object?> toMap() {
    return {
      'driverCode':        driverCode,
      'dwrCode':           dwrCode,
      'phoneNumber':       phoneNumber,
      'token':             token,
      'deviceInformation': deviceInformation,
      'deviceId':          deviceId,
      'langCode':          langCode,
    };
  }

  Map<String, Object?> toMapRequest() {
    return {
      'driver_code':  driverCode,
      'dwr_code':     dwrCode,
      'phone_number': phoneNumber,
      'token':        token,
      'device_info':  deviceInformation,
      'device_id':    deviceId,
      'lang_code':    langCode,
    };
  }

}

class DriverTable {
  static const databaseName   = 'drivers.db';
  static const tableName      = 'driver';
  static const tableColumns   = [
    'id',
    'driverCode',
    'dwrCode',
    'phoneNumber',
    'token',
    'deviceInformation',
    'deviceId',
    'langCode',
  ];

  static const tableStructure =
      "CREATE TABLE driver("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "driverCode TEXT NOT NULL,"
        "dwrCode TEXT NOT NULL,"
        "phoneNumber TEXT,"
        "token TEXT,"
        "deviceInformation TEXT,"
        "deviceId TEXT,"
        "langCode TEXT"
      ")";
}