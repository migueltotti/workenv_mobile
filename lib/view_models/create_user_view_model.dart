import 'package:work_env_mobile/depency_injection_config/dependency_injection.dart';
import 'package:work_env_mobile/domain/entities/user/user_request.dart';
import 'package:work_env_mobile/domain/entities/user/user_response.dart';
import 'package:work_env_mobile/domain/enums/privacy.dart';
import 'package:work_env_mobile/domain/result/result.dart';
import 'package:work_env_mobile/services/encrypt_service.dart';
import 'package:work_env_mobile/services/user_service.dart';

class CreateUserViewModel {
  final UserService _userService;
  final CryptoService _cryptoService;

  CreateUserViewModel(UserService userService, CryptoService cryptoService) : _userService = userService, _cryptoService = cryptoService;

  Future<Result<UserResponse>> registerUser({
    required String name,
    required String email,
    required String password,
    required String cpfOrCnpj,
    required DateTime birthDate,
    required Privacy privacy,
    required String profilePicture,
    required String personalDescription,
  }) async {
    UserRequest newUser = UserRequest(
      name: name,
      email: email,
      password: _cryptoService.encrypt(password),
      cpfCnpj: cpfOrCnpj,
      dateBirth: birthDate,
      profilePicture: profilePicture,
      personalDescription: personalDescription,
      privacy: privacy,
    );

    return await _userService.createUser(newUser);
  }
}
