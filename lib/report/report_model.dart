import 'package:reporting_system/database/app_database.dart';

class ReportModel {
  int id;
  String description;
  String imagePath;
  String username;
  int status;

  ReportModel({
    this.id,
    this.description,
    this.imagePath,
    this.username,
    this.status,
  });

  ReportMoorModelData toMoor() {
    return ReportMoorModelData(
        id: this.id,
        description: this.description,
        imagepath: this.imagePath,
        username: this.username,
        status: this.status);
  }
}
