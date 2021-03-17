// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class LoginMoorModelData extends DataClass
    implements Insertable<LoginMoorModelData> {
  final int id;
  final String userName;
  final String password;
  final int role;
  LoginMoorModelData(
      {@required this.id,
      @required this.userName,
      @required this.password,
      @required this.role});
  factory LoginMoorModelData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return LoginMoorModelData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      userName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_name']),
      password: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}password']),
      role: intType.mapFromDatabaseResponse(data['${effectivePrefix}role']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || userName != null) {
      map['user_name'] = Variable<String>(userName);
    }
    if (!nullToAbsent || password != null) {
      map['password'] = Variable<String>(password);
    }
    if (!nullToAbsent || role != null) {
      map['role'] = Variable<int>(role);
    }
    return map;
  }

  LoginMoorModelCompanion toCompanion(bool nullToAbsent) {
    return LoginMoorModelCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      userName: userName == null && nullToAbsent
          ? const Value.absent()
          : Value(userName),
      password: password == null && nullToAbsent
          ? const Value.absent()
          : Value(password),
      role: role == null && nullToAbsent ? const Value.absent() : Value(role),
    );
  }

  factory LoginMoorModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return LoginMoorModelData(
      id: serializer.fromJson<int>(json['id']),
      userName: serializer.fromJson<String>(json['userName']),
      password: serializer.fromJson<String>(json['password']),
      role: serializer.fromJson<int>(json['role']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userName': serializer.toJson<String>(userName),
      'password': serializer.toJson<String>(password),
      'role': serializer.toJson<int>(role),
    };
  }

  LoginMoorModelData copyWith(
          {int id, String userName, String password, int role}) =>
      LoginMoorModelData(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        password: password ?? this.password,
        role: role ?? this.role,
      );
  @override
  String toString() {
    return (StringBuffer('LoginMoorModelData(')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('password: $password, ')
          ..write('role: $role')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(userName.hashCode, $mrjc(password.hashCode, role.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is LoginMoorModelData &&
          other.id == this.id &&
          other.userName == this.userName &&
          other.password == this.password &&
          other.role == this.role);
}

class LoginMoorModelCompanion extends UpdateCompanion<LoginMoorModelData> {
  final Value<int> id;
  final Value<String> userName;
  final Value<String> password;
  final Value<int> role;
  const LoginMoorModelCompanion({
    this.id = const Value.absent(),
    this.userName = const Value.absent(),
    this.password = const Value.absent(),
    this.role = const Value.absent(),
  });
  LoginMoorModelCompanion.insert({
    this.id = const Value.absent(),
    @required String userName,
    @required String password,
    @required int role,
  })  : userName = Value(userName),
        password = Value(password),
        role = Value(role);
  static Insertable<LoginMoorModelData> custom({
    Expression<int> id,
    Expression<String> userName,
    Expression<String> password,
    Expression<int> role,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userName != null) 'user_name': userName,
      if (password != null) 'password': password,
      if (role != null) 'role': role,
    });
  }

  LoginMoorModelCompanion copyWith(
      {Value<int> id,
      Value<String> userName,
      Value<String> password,
      Value<int> role}) {
    return LoginMoorModelCompanion(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      role: role ?? this.role,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (role.present) {
      map['role'] = Variable<int>(role.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoginMoorModelCompanion(')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('password: $password, ')
          ..write('role: $role')
          ..write(')'))
        .toString();
  }
}

class $LoginMoorModelTable extends LoginMoorModel
    with TableInfo<$LoginMoorModelTable, LoginMoorModelData> {
  final GeneratedDatabase _db;
  final String _alias;
  $LoginMoorModelTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _userNameMeta = const VerificationMeta('userName');
  GeneratedTextColumn _userName;
  @override
  GeneratedTextColumn get userName => _userName ??= _constructUserName();
  GeneratedTextColumn _constructUserName() {
    return GeneratedTextColumn(
      'user_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  GeneratedTextColumn _password;
  @override
  GeneratedTextColumn get password => _password ??= _constructPassword();
  GeneratedTextColumn _constructPassword() {
    return GeneratedTextColumn(
      'password',
      $tableName,
      false,
    );
  }

  final VerificationMeta _roleMeta = const VerificationMeta('role');
  GeneratedIntColumn _role;
  @override
  GeneratedIntColumn get role => _role ??= _constructRole();
  GeneratedIntColumn _constructRole() {
    return GeneratedIntColumn(
      'role',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, userName, password, role];
  @override
  $LoginMoorModelTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'login_moor_model';
  @override
  final String actualTableName = 'login_moor_model';
  @override
  VerificationContext validateIntegrity(Insertable<LoginMoorModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name'], _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password'], _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role'], _roleMeta));
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LoginMoorModelData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return LoginMoorModelData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $LoginMoorModelTable createAlias(String alias) {
    return $LoginMoorModelTable(_db, alias);
  }
}

class ReportMoorModelData extends DataClass
    implements Insertable<ReportMoorModelData> {
  final int id;
  final String description;
  final String imagepath;
  final String username;
  ReportMoorModelData(
      {@required this.id,
      @required this.description,
      @required this.imagepath,
      @required this.username});
  factory ReportMoorModelData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return ReportMoorModelData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      imagepath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}imagepath']),
      username: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}username']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || imagepath != null) {
      map['imagepath'] = Variable<String>(imagepath);
    }
    if (!nullToAbsent || username != null) {
      map['username'] = Variable<String>(username);
    }
    return map;
  }

  ReportMoorModelCompanion toCompanion(bool nullToAbsent) {
    return ReportMoorModelCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      imagepath: imagepath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagepath),
      username: username == null && nullToAbsent
          ? const Value.absent()
          : Value(username),
    );
  }

  factory ReportMoorModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ReportMoorModelData(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      imagepath: serializer.fromJson<String>(json['imagepath']),
      username: serializer.fromJson<String>(json['username']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'imagepath': serializer.toJson<String>(imagepath),
      'username': serializer.toJson<String>(username),
    };
  }

  ReportMoorModelData copyWith(
          {int id, String description, String imagepath, String username}) =>
      ReportMoorModelData(
        id: id ?? this.id,
        description: description ?? this.description,
        imagepath: imagepath ?? this.imagepath,
        username: username ?? this.username,
      );
  @override
  String toString() {
    return (StringBuffer('ReportMoorModelData(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('imagepath: $imagepath, ')
          ..write('username: $username')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          description.hashCode, $mrjc(imagepath.hashCode, username.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ReportMoorModelData &&
          other.id == this.id &&
          other.description == this.description &&
          other.imagepath == this.imagepath &&
          other.username == this.username);
}

class ReportMoorModelCompanion extends UpdateCompanion<ReportMoorModelData> {
  final Value<int> id;
  final Value<String> description;
  final Value<String> imagepath;
  final Value<String> username;
  const ReportMoorModelCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.imagepath = const Value.absent(),
    this.username = const Value.absent(),
  });
  ReportMoorModelCompanion.insert({
    this.id = const Value.absent(),
    @required String description,
    @required String imagepath,
    @required String username,
  })  : description = Value(description),
        imagepath = Value(imagepath),
        username = Value(username);
  static Insertable<ReportMoorModelData> custom({
    Expression<int> id,
    Expression<String> description,
    Expression<String> imagepath,
    Expression<String> username,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (imagepath != null) 'imagepath': imagepath,
      if (username != null) 'username': username,
    });
  }

  ReportMoorModelCompanion copyWith(
      {Value<int> id,
      Value<String> description,
      Value<String> imagepath,
      Value<String> username}) {
    return ReportMoorModelCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      imagepath: imagepath ?? this.imagepath,
      username: username ?? this.username,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (imagepath.present) {
      map['imagepath'] = Variable<String>(imagepath.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReportMoorModelCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('imagepath: $imagepath, ')
          ..write('username: $username')
          ..write(')'))
        .toString();
  }
}

class $ReportMoorModelTable extends ReportMoorModel
    with TableInfo<$ReportMoorModelTable, ReportMoorModelData> {
  final GeneratedDatabase _db;
  final String _alias;
  $ReportMoorModelTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imagepathMeta = const VerificationMeta('imagepath');
  GeneratedTextColumn _imagepath;
  @override
  GeneratedTextColumn get imagepath => _imagepath ??= _constructImagepath();
  GeneratedTextColumn _constructImagepath() {
    return GeneratedTextColumn(
      'imagepath',
      $tableName,
      false,
    );
  }

  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  GeneratedTextColumn _username;
  @override
  GeneratedTextColumn get username => _username ??= _constructUsername();
  GeneratedTextColumn _constructUsername() {
    return GeneratedTextColumn(
      'username',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, description, imagepath, username];
  @override
  $ReportMoorModelTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'report_moor_model';
  @override
  final String actualTableName = 'report_moor_model';
  @override
  VerificationContext validateIntegrity(
      Insertable<ReportMoorModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('imagepath')) {
      context.handle(_imagepathMeta,
          imagepath.isAcceptableOrUnknown(data['imagepath'], _imagepathMeta));
    } else if (isInserting) {
      context.missing(_imagepathMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username'], _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReportMoorModelData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ReportMoorModelData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ReportMoorModelTable createAlias(String alias) {
    return $ReportMoorModelTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $LoginMoorModelTable _loginMoorModel;
  $LoginMoorModelTable get loginMoorModel =>
      _loginMoorModel ??= $LoginMoorModelTable(this);
  $ReportMoorModelTable _reportMoorModel;
  $ReportMoorModelTable get reportMoorModel =>
      _reportMoorModel ??= $ReportMoorModelTable(this);
  LoginDao _loginDao;
  LoginDao get loginDao => _loginDao ??= LoginDao(this as AppDatabase);
  ReportDao _reportDao;
  ReportDao get reportDao => _reportDao ??= ReportDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [loginMoorModel, reportMoorModel];
}
