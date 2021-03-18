import 'package:moor_flutter/moor_flutter.dart';
import 'package:reporting_system/database/app_database.dart';
import 'package:reporting_system/report/database/report_moor_model.dart';

part 'report_moor_dao.g.dart';

@UseDao(tables: [ReportMoorModel])
class ReportDao extends DatabaseAccessor<AppDatabase> with _$ReportDaoMixin {
  final AppDatabase db;
  ReportDao(this.db) : super(db);

  Future<int> insertIntoReportTable(ReportMoorModelData data) async {
    try {
      int id = await into(db.reportMoorModel).insert(data);
      return id;
    } catch (e) {
      await updateReportTable(data);
    }
  }

  Future<bool> updateReportTable(ReportMoorModelData data) async {
    try {
      bool isUpdated = await update(db.reportMoorModel).replace(data);
      return isUpdated;
    } catch (e) {
      return false;
    }
  }

  Future<List<ReportMoorModelData>> getReportData() async {
    return await (select(db.reportMoorModel)).get();
  }

  Future<List<ReportMoorModelData>> getReportDataByUser(String username) async {
    return await ((select(db.reportMoorModel)
          ..where((tbl) => tbl.username.equals(username))))
        .get();
  }

  Future<List<ReportMoorModelData>> getReportDataByID(int id) async {
    return await ((select(db.reportMoorModel)
          ..where((tbl) => tbl.id.equals(id))))
        .get();
  }

  Future<int> deleteAll() async {
    return await delete(db.reportMoorModel).go();
  }
}
