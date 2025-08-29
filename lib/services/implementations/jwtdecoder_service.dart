import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:work_env_mobile/services/abstractions/jwt_decoder.dart';

class JwtDecoderImpl implements JwtDecoderAbstraction{

  @override
  Map<String, dynamic> decodeToken(String token) {
    return JwtDecoder.decode(token);
  }
  
  @override
  bool isExpired(String token) {
    return JwtDecoder.isExpired(token);
  }

  @override
  DateTime? getExpirationDate(String token) {
    return JwtDecoder.getExpirationDate(token);
  }

  @override
  Duration? getRemainingTime(String token) {
    return JwtDecoder.getRemainingTime(token);
  }

  @override
  Duration? getTokenTime(String token) {
    return JwtDecoder.getTokenTime(token);
  }

  @override
  String? getUserName(String token) {
    var decodedToken = JwtDecoder.decode(token);

    var name = decodedToken['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name'] as String;

    return name.replaceAll('_', ' ');
  }

  @override
  String? getEmail(String token) {
    var decodedToken = JwtDecoder.decode(token);

    return decodedToken['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress'];
  }
}