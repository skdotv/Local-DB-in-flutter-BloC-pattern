import 'package:flutter/material.dart';
import 'package:reporting_system/database/app_database.dart';
import 'package:reporting_system/login/login_model.dart';
import 'package:reporting_system/main.dart';
import 'package:reporting_system/report/add_report_screen.dart';
import 'package:reporting_system/reportList/report_list_screen.dart';
import 'package:rxdart/subjects.dart';
// admin = 1 , user = 2

class LoginBloc {
  final usernameController = BehaviorSubject<String>();
  final passwordController = BehaviorSubject<String>();

  login(BuildContext context) async {
    LoginModel loginModel = LoginModel(
      username: usernameController.valueWrapper.value,
      password: passwordController.valueWrapper.value,
      role: 1,
    );

    LoginMoorModelData data = loginModel.toMoor();
    int resp = await appDatabase.loginDao.loginAuth(data);
    if (resp != 0 && resp == 2) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => AddReportScreen(
                    username: usernameController.valueWrapper.value,
                  )));

      print("authorised user");
    } else if (resp != 0 && resp == 1) {
      // ReportListScreen
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => ReportListScreen(
                    role: 1,
                  )));
      print("authorised admin");
    } else {
      usernameController.addError("");
      passwordController.addError("User does not exist");
      print("un authorised");
    }
  }

  void dispose() {
    passwordController.close();
    usernameController.close();
  }
}
