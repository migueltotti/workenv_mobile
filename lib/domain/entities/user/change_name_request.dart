class ChangeUserName{
  String userId;
  String newName;

  ChangeUserName({required this.userId, required this.newName});

  factory ChangeUserName.fromJson(Map<String, dynamic> json) {
    return ChangeUserName(
      userId: json['userId'] as String,
      newName: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId" : userId,
      "newName": newName
    };
  }
}