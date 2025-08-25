class ResponseUser {
  String userId;
  String name;
  String email;
  String cpfCnpj;
  DateTime dateBirth;

  ResponseUser({
    required this.userId,
    required this.name,
    required this.email,
    required this.cpfCnpj,
    required this.dateBirth,
  });

  factory ResponseUser.fromJson(Map<String, dynamic> json) {
    return ResponseUser(
      userId: json['userId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      cpfCnpj: json['cpfCnpj'] as String,
      dateBirth: DateTime.parse(json['dateBirth'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "name": name,
      "email": email,
      "cpfCnpj": cpfCnpj,
      "dateBirth": dateBirth.toIso8601String(),
    };
  }
}
