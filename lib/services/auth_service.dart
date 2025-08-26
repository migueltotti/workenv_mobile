import 'package:dio/dio.dart';
import 'package:work_env_mobile/domain/result/result.dart';

class AuthService {
  static String? token;
  static String? refreshToken;
  static DateTime? refreshTokenExpireAt;
  final Dio _api;

  AuthService(this._api);

  static void setToken(String newToken) {
    token = newToken;
  }

  static String? getToken() {
    return token;
  }

  static void clearToken() {
    token = null;
  }

  static void setRefreshToken(String newRefreshToken, DateTime expireAt) {
    refreshToken = newRefreshToken;
    refreshTokenExpireAt = expireAt;
  }

  static String? getRefreshToken() {
    return refreshToken;
  }

  static DateTime? getRefreshTokenExpiration() {
    return refreshTokenExpireAt;
  }

  static void clearRefreshToken() {
    refreshToken = null;
    refreshTokenExpireAt = null;
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