import 'package:dio/dio.dart';
import 'package:work_env_mobile/domain/result/result.dart';

class AuthService {
  static String? _token;
  static String? _refreshToken;
  static DateTime? _refreshTokenExpireAt;
  final Dio _api;

  AuthService(this._api);

  String? get token => _token;
  String? get refreshToken => _refreshToken;
  DateTime? get refreshTokenExpiration => _refreshTokenExpireAt;

  static void setToken(String newToken) {
    _token = newToken;
  }

  static void setRefreshToken(String newRefreshToken, DateTime expireAt) {
    _refreshToken = newRefreshToken;
    _refreshTokenExpireAt = expireAt;
  }

  static void clearToken() {
    _token = null;
  }

  static void clearRefreshToken() {
    _refreshToken = null;
    _refreshTokenExpireAt = null;
  }

  Future<ResultVoid> login(String email, String encryptedPassword) async {
    final response = await _api.post('/Auth/login', data: {
      'email': email,
      'password': encryptedPassword,
    });

    if (response.statusCode == 200) {
      setToken(response.data['accessToken']);
      setRefreshToken(response.data['refreshToken'], DateTime.parse(response.data['refreshTokenExpiresAt']));
      return ResultVoid.success();
    } else {
      return ResultVoid.failure(error: response.data);
    }
  }

  void logout() {
    clearToken();
    clearRefreshToken();
  }
}