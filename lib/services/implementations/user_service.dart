
import 'package:dio/dio.dart';
import 'package:work_env_mobile/domain/entities/user/change_birth_date_request.dart';
import 'package:work_env_mobile/domain/entities/user/change_email_request.dart';
import 'package:work_env_mobile/domain/entities/user/change_name_request.dart';
import 'package:work_env_mobile/domain/entities/user/change_password_request.dart';
import 'package:work_env_mobile/domain/entities/user/change_personal_description_request.dart';
import 'package:work_env_mobile/domain/entities/user/change_privacy_request.dart';
import 'package:work_env_mobile/domain/entities/user/change_profile_picture_request.dart';
import 'package:work_env_mobile/domain/entities/user/user_request.dart';
import 'package:work_env_mobile/domain/entities/user/user_response.dart';
import 'package:work_env_mobile/domain/result/result.dart';

class UserService {
  final Dio api;
  static const String _baseUrl = '/Users';

  UserService(this.api);

  Future<UserResponse> getUserById(String id) async {
    final response = await api.get('$_baseUrl/$id');
    return UserResponse.fromJson(response.data);
  }

  Future<List<UserResponse>> getUsers(String id) async {
    final response = await api.get('$_baseUrl/$id');
    return (response.data as List)
        .map((user) => UserResponse.fromJson(user))
        .toList();
  }

  Future<Result<UserResponse>> getUserByEmail(String email) async {
    final response = await api.get('$_baseUrl/?userEmail=$email');

    return response.statusCode! < 400
        ? Result.success(value: UserResponse.fromJson(response.data))
        : Result.failure(error: response.data);
  }

  Future<Result<UserResponse>> getUserByName(String name) async {
    final response = await api.get('$_baseUrl/?userName=$name');

    return response.statusCode! < 400
        ? Result.success(value: UserResponse.fromJson(response.data))
        : Result.failure(error: response.data);
  }

  Future<Result<UserResponse>> createUser(UserRequest user) async {
    final response = await api.post(_baseUrl, data: user.toJson());

    return response.statusCode! < 400
        ? Result.success(value: UserResponse.fromJson(response.data))
        : Result.failure(error: response.data);
  }

  Future<Result<UserResponse>> changeName(
    String userId,
    ChangeUserName user,
  ) async {
    final response = await api.put(
      '$_baseUrl/changeName/$userId',
      data: user.toJson(),
    );

    return response.statusCode! < 400
        ? Result.success(value: UserResponse.fromJson(response.data))
        : Result.failure(error: response.data);
  }

  Future<Result<UserResponse>> changeEmail(
    String userId,
    ChangeUserEmail user,
  ) async {
    final response = await api.put(
      '$_baseUrl/changeEmail/$userId',
      data: user.toJson(),
    );

    return response.statusCode! < 400
        ? Result.success(value: UserResponse.fromJson(response.data))
        : Result.failure(error: response.data);
  }

  Future<Result<UserResponse>> changePassword(
    String userId,
    ChangeUserPassword user,
  ) async {
    final response = await api.put(
      '$_baseUrl/changePassword/$userId',
      data: user.toJson(),
    );

    return response.statusCode! < 400
        ? Result.success(value: UserResponse.fromJson(response.data))
        : Result.failure(error: response.data);
  }

  Future<Result<UserResponse>> changeBirthDate(
    String userId,
    ChangeBirthDate user,
  ) async {
    final response = await api.put(
      '$_baseUrl/changeBirthDate/$userId',
      data: user.toJson(),
    );

    return response.statusCode! < 400
        ? Result.success(value: UserResponse.fromJson(response.data))
        : Result.failure(error: response.data);
  }

  Future<Result<UserResponse>> changePersonalDescription(
    String userId,
    ChangePersonalDescription user,
  ) async {
    final response = await api.put(
      '$_baseUrl/changePersonalDescription/$userId',
      data: user.toJson(),
    );

    return response.statusCode! < 400
        ? Result.success(value: UserResponse.fromJson(response.data))
        : Result.failure(error: response.data);
  }

  Future<Result<UserResponse>> changeProfilePicture(
    String userId,
    ChangeProfilePicture user,
  ) async {
    final response = await api.put(
      '$_baseUrl/changeProfilePicture/$userId',
      data: user.toJson(),
    );

    return response.statusCode! < 400
        ? Result.success(value: UserResponse.fromJson(response.data))
        : Result.failure(error: response.data);
  }

  Future<Result<UserResponse>> changePrivacy(
    String userId,
    ChangeUserPrivacy user,
  ) async {
    final response = await api.put(
      '$_baseUrl/changePrivacy/$userId',
      data: user.toJson(),
    );

    return response.statusCode! < 400
        ? Result.success(value: UserResponse.fromJson(response.data))
        : Result.failure(error: response.data);
  }

  Future<ResultVoid> delete(String userId) async {
    final response = await api.delete('$_baseUrl/$userId');

    return response.statusCode! < 400
        ? ResultVoid.success()
        : ResultVoid.failure(error: response.data);
  }
}
