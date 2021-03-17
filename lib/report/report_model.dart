import 'package:reporting_system/database/app_database.dart';

class ReportModel {
  int id;
  String description;
  String imagePath;
  String username;

  ReportModel({
    this.id,
    this.description,
    this.imagePath,
    this.username,
  });

  ReportMoorModelData toMoor() {
    return ReportMoorModelData(
      id: this.id,
      description: this.description,
      imagepath: this.imagePath,
      username: this.username,
    );
  }
}
