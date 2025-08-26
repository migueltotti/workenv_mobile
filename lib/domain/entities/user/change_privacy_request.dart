class ChangeUserPrivacy {
  String userId;
  String privacy;

  ChangeUserPrivacy({required this.userId, required this.privacy});

  factory ChangeUserPrivacy.fromJson(Map<String, dynamic> json) {
    return ChangeUserPrivacy(
      userId: json['userId'] as String,
      privacy: json['privacy'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {"userId": userId, "privacy": privacy};
  }
}
