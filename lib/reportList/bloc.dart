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

  void dispose() {
    reportListController.close();
  }
}
