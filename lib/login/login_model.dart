import 'package:reporting_system/database/app_database.dart';

class LoginModel {
  int id;
  String username;
  String password;
  int role;

  LoginModel({
    this.id,
    this.username,
    this.password,
    this.role,
  });

  LoginMoorModelData toMoor() {
    return LoginMoorModelData(
      id: this.id,
      userName: this.username,
      password: this.password,
      role: this.role,
    );
  }
}
