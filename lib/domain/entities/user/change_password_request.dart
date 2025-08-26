class ChangeUserPassword{
  String userId;
  String oldPassword;
  String newPassword;

  ChangeUserPassword({required this.userId, required this.oldPassword, required this.newPassword});

  factory ChangeUserPassword.fromJson(Map<String, dynamic> json) {
    return ChangeUserPassword(
      userId: json['userId'] as String,
      oldPassword: json['oldPassword'] as String,
      newPassword: json['newPassword'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId" : userId,
      "oldPassword": oldPassword,
      "newPassword": newPassword,
    };
  }
}