class ChangeBirthDate{
  String userId;
  String newBirthDate;

  ChangeBirthDate({required this.userId, required this.newBirthDate});

  factory ChangeBirthDate.fromJson(Map<String, dynamic> json) {
    return ChangeBirthDate(
      userId: json['userId'] as String,
      newBirthDate: json['newBirthDate'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId" : userId,
      "newBirthDate": newBirthDate
    };
  }
}