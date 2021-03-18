import 'package:reporting_system/appcolor/appcolor.dart';
import 'package:reporting_system/database/app_database.dart';
import 'package:reporting_system/main.dart';
import 'package:reporting_system/report/report_model.dart';
import 'package:rxdart/subjects.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReportBloc {
  final descriptionController = BehaviorSubject<String>();
  final imageUploadController = BehaviorSubject<String>();

  String userName;

  submitReport() async {
    ReportModel model = ReportModel(
        description: descriptionController.valueWrapper.value,
        imagePath: imageUploadController.valueWrapper.value,
        username: userName,
        status: 0);

    await appDatabase.reportDao.insertIntoReportTable(model.toMoor());

    List<ReportMoorModelData> data =
        await appDatabase.reportDao.getReportData();
    print(data);
    descriptionController.sink.add(null);
    imageUploadController.sink.add(null);
    Fluttertoast.showToast(
        msg: "Added Sucessfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColor.kTextBoxFillColor,
        textColor: AppColor.kPrimaryColor,
        fontSize: 16.0);
  }

  void dispose() {
    imageUploadController.close();
    descriptionController.close();
  }
}
