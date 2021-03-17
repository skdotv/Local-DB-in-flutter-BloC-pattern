import 'package:moor_flutter/moor_flutter.dart';
import 'package:reporting_system/login/database/login_moor_dao.dart';
import 'package:reporting_system/login/database/login_moor_model.dart';
import 'package:reporting_system/report/database/report_moor_dao.dart';
import 'package:reporting_system/report/database/report_moor_model.dart';

part 'app_database.g.dart';

@UseMoor(tables: [
  LoginMoorModel,
  ReportMoorModel
], daos: [
  LoginDao,
  ReportDao,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: "reporting_system.sqlite", logStatements: false));

  @override
  int get schemaVersion => 1;
}
