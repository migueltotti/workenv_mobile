class ChangePersonalDescription{
  String userId;
  String newPersonalDescription;

  ChangePersonalDescription({required this.userId, required this.newPersonalDescription});

  factory ChangePersonalDescription.fromJson(Map<String, dynamic> json) {
    return ChangePersonalDescription(
      userId: json['userId'] as String,
      newPersonalDescription: json['newPersonalDescription'] as String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId" : userId,
      "newPersonalDescription": newPersonalDescription
    };
  }
}