import 'package:flutter/material.dart';
import 'package:reporting_system/database/app_database.dart';
import 'package:reporting_system/login/login_scren.dart';

AppDatabase appDatabase;
void main() {
  appDatabase = AppDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // appDatabase.loginDao.insertIntoLoginTable(LoginMoorModelData(
    //     id: 1, userName: "vinod", password: "123456", role: 2));
    // appDatabase.loginDao.insertIntoLoginTable(LoginMoorModelData(
    //     id: 2, userName: "santosh", password: "123456", role: 2));
    // appDatabase.loginDao.insertIntoLoginTable(LoginMoorModelData(
    //     id: 3, userName: "Admin", password: "root", role: 1));

    return MaterialApp(
      title: 'Reporting System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
