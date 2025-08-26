class ChangeProfilePicture{
  String userId;
  String newProfilePicture;

  ChangeProfilePicture({required this.userId, required this.newProfilePicture});

  factory ChangeProfilePicture.fromJson(Map<String, dynamic> json) {
    return ChangeProfilePicture(
      userId: json['userId'] as String,
      newProfilePicture: json['newProfilePicture'] as String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId" : userId,
      "newProfilePicture": newProfilePicture
    };
  }
}