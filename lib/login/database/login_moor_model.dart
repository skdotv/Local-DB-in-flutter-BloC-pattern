import 'package:moor_flutter/moor_flutter.dart';

class LoginMoorModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userName => text()();
  TextColumn get password => text()();
  IntColumn get role => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
