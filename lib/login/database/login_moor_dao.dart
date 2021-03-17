import 'package:moor_flutter/moor_flutter.dart';
import 'package:reporting_system/database/app_database.dart';
import 'package:reporting_system/login/database/login_moor_model.dart';

part 'login_moor_dao.g.dart';

@UseDao(tables: [LoginMoorModel])
class LoginDao extends DatabaseAccessor<AppDatabase> with _$LoginDaoMixin {
  final AppDatabase db;
  LoginDao(this.db) : super(db);

  Future<int> insertIntoLoginTable(LoginMoorModelData data) async {
    try {
      int id = await into(db.loginMoorModel).insert(data);
      return id;
    } catch (e) {
      await updateLoginTable(data);
    }
  }

  Future<int> loginAuth(LoginMoorModelData data) async {
    try {
      if (data != null) {
        int role;
        List<LoginMoorModelData> loginData = await getLoginData();
        role = loginData
            .firstWhere((element) =>
                (element.userName.trim() == data.userName.trim() &&
                    element.password.trim() == data.password.trim()))
            ?.role;
        if (role != null) {
          return role;
        } else {
          return 0;
        }
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }

  Future<bool> updateLoginTable(LoginMoorModelData data) async {
    try {
      bool isUpdated = await update(db.loginMoorModel).replace(data);
      return isUpdated;
    } catch (e) {
      return false;
    }
  }

  Future<List<LoginMoorModelData>> getLoginData() async {
    return await (select(db.loginMoorModel)).get();
  }

  Future<int> deleteAll() async {
    return await delete(db.loginMoorModel).go();
  }
}
