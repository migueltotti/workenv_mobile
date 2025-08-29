abstract class JwtDecoderAbstraction {
  Map<String, dynamic> decodeToken(String token);
  bool isExpired(String token);
  DateTime? getExpirationDate(String token);
  Duration? getTokenTime(String token);
  Duration? getRemainingTime(String token);
  String? getUserName(String token);
  String? getEmail(String token);
}