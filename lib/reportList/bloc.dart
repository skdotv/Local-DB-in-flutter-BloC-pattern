import 'package:reporting_system/database/app_database.dart';
import 'package:reporting_system/main.dart';
import 'package:rxdart/subjects.dart';

class ReportListBloc {
  ReportListBloc({String username}) {
    fetchData(username: username);
  }
  final reportListController = BehaviorSubject<List<ReportMoorModelData>>();

  Future fetchData({String username}) async {
    List<ReportMoorModelData> reportListData = [];
    if (username != null) {
      reportListData =
          await appDatabase.reportDao.getReportDataByUser(username);
    } else {
      reportListData = await appDatabase.reportDao.getReportData();
    }
    reportListController.sink.add(reportListData);
  }

  updateStatus({int id}) async {
    List<ReportMoorModelData> _data = [];
    List<ReportMoorModelData> updatedData = [];

    if (id != null) {
      _data = await appDatabase.reportDao.getReportDataByID(id);
      if (_data.first.status == 0) {
        _data.first = _data.first.copyWith(status: 1);
      } else {
        _data.first = _data.first.copyWith(status: 0);
      }
      await appDatabase.reportDao.updateReportTable(_data.first);
    }
    updatedData = await appDatabase.reportDao.getReportData();
    reportListController.sink.add(updatedData);
  }

  void dispose() {
    reportListController.close();
  }
}
