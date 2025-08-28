import 'package:work_env_mobile/domain/enums/privacy.dart';

class UserResponse {
  String userId;
  String name;
  String email;
  DateTime dateBirth;
  String profilePicture;
  Privacy privacy;
  String personalDescription;

  UserResponse({
    required this.userId,
    required this.name,
    required this.email,
    required this.dateBirth,
    required this.profilePicture,
    required this.privacy,
    required this.personalDescription,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      userId: json['userId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      dateBirth: DateTime.parse(json['dateBirth'] as String),
      profilePicture: json['profilePicture'] as String,
      privacy: Privacy.fromIntValue(json['privacy'] as int),
      personalDescription: json['personalDescription'] as String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "name": name,
      "email": email,
      "dateBirth": dateBirth.toIso8601String(),
      "profilePicture": profilePicture,
      "privacy": privacy.value,
      "personalDescription": personalDescription
    };
  }
}
