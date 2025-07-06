import 'dart:async';

import 'package:psico_app/app/core/mixins/local_database.dart';
import 'package:psico_app/app/data/models/driver.dart';

class DriverProvider with LocalDatabase {
  String get databaseName   => DriverTable.databaseName;
  String get tableName      => DriverTable.tableName;
  String get tableStructure => DriverTable.tableStructure;

  DriverModel driver = DriverModel();
  DriverModel get data => driver;

  Future<bool> insertDriver(driverCode, dwrCode) async {
    DriverModel driver = DriverModel(
        driverCode:  driverCode.toString().toUpperCase(),
        dwrCode:     dwrCode.toString()
    );

    await insertDatabaseData(
        driver.toMap(),
        clear: true
    );

    return Future.value(true);
  }

  Future<DriverModel> loadDriver() async {
    final maps = await loadDatabaseData();

    if (maps.length > 0) {
      driver = DriverModel(
          driverCode:         maps[0]['driverCode'],
          dwrCode:            maps[0]['dwrCode'],
          phoneNumber:        maps[0]['phoneNumber'],
          token:              maps[0]['token'],
          deviceInformation:  maps[0]['deviceInformation'],
          deviceId:           maps[0]['deviceId'],
          langCode:           maps[0]['langCode'],
      );
    }

    return Future.value(driver);
  }

  Future<bool> updateDriver() async {
    await updateDatabaseData(
      data.toMap(),
      where: "driverCode = ?",
      whereArgs: [data.driverCode]
    );

    return Future.value(true);
  }

  Future<bool> checkColumns() async {
    await checkColumnsDB(DriverTable.tableColumns, 'driver');

    return Future.value(true);
  }
}