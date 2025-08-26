class ChangeUserEmail{
  String userId;
  String newEmail;

  ChangeUserEmail({required this.userId, required this.newEmail});

  factory ChangeUserEmail.fromJson(Map<String, dynamic> json) {
    return ChangeUserEmail(
      userId: json['userId'] as String,
      newEmail: json['newEmail'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId" : userId,
      "newEmail": newEmail
    };
  }
}