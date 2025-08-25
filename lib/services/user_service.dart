import 'package:dio/dio.dart';
import 'package:work_env_mobile/domain/entities/user/request_user.dart';
import 'package:work_env_mobile/domain/entities/user/response_user.dart';

class UserService {

  final Dio api;
  static const String _baseUrl = '/Users';

  UserService(this.api);

  Future<ResponseUser> getUserById(String id) async {
    final response = await api.get('$_baseUrl/$id');
    return ResponseUser.fromJson(response.data);
  }

  Future<List<ResponseUser>> getUsers(String id) async {
    final response = await api.get('$_baseUrl/$id');
    return (response.data as List)
      .map((user) => ResponseUser.fromJson(user)).toList();
  }

  Future<ResponseUser> registerUser(RequestUser user) async {
    final response = await api.post(_baseUrl, data: user.toJson());
    return ResponseUser.fromJson(response.data);
  }
}