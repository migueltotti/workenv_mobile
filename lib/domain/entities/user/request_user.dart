import 'package:work_env_mobile/domain/enums/privacy.dart';

class RequestUser {
  String name;
  String email;
  String password;
  String cpfCnpj;
  DateTime dateBirth;
  String profilePicture;
  String personalDescription;
  Privacy privacy;

  RequestUser({
    required this.name,
    required this.email,
    required this.password,
    required this.cpfCnpj,
    required this.dateBirth,
    required this.profilePicture,
    required this.personalDescription,
    required this.privacy,
  });

  factory RequestUser.fromJson(Map<String, dynamic> json) {
    return RequestUser(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      cpfCnpj: json['cpfCnpj'] as String,
      dateBirth: DateTime.parse(json['dateBirth'] as String),
      profilePicture: json['profilePicture'] as String,
      personalDescription: json['personalDescription'] as String,
      privacy: Privacy.fromValue(json['privacy'] as int),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "cpfCnpj": cpfCnpj,
      "dateBirth": dateBirth.toIso8601String(),
      "profilePicture": profilePicture,
      "personalDescription": personalDescription,
      "privacy": privacy.toJson(),
    };
  }
}
