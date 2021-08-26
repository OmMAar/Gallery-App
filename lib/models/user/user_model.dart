

class UserFields {
  static final List<String> values = [
    /// Add all fields
    id, email, fullName, password
  ];

  static final String id = '_id';
  static final String email = 'email';
  static final String fullName = 'fullName';
  static final String password = 'password';

}

class UserModel {
  final int? id;
  final String email;
  final String fullName;
  final String password;


  const UserModel({
    this.id,
    required this.password,
    required this.fullName,
    required this.email,
  });

  UserModel copy({
    int? id,
    String? email,
    String? fullName,
    String? password,
  }) =>
      UserModel(
        id: id ?? this.id,
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        password: password ?? this.password,
      );

  static UserModel fromJson(Map<String, Object?> json) => UserModel(
    id: json[UserFields.id] as int?,
    email: json[UserFields.email] as String,
    fullName: json[UserFields.fullName] as String,
    password: json[UserFields.password] as String,
  );

  Map<String, Object?> toJson() => {
    UserFields.id: id,
    UserFields.password: password,
    UserFields.fullName: fullName,
    UserFields.email: email,
  };
}