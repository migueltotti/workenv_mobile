import 'package:work_env_mobile/services/abstractions/jwt_decoder.dart';
import 'package:work_env_mobile/services/implementations/auth_service.dart';

class HomeViewModel {
  final JwtDecoderAbstraction _jwtDecoder;
  final AuthService _authService;

  HomeViewModel(JwtDecoderAbstraction jwtDecoder, AuthService authService)
    : _jwtDecoder = jwtDecoder,
      _authService = authService;

  String name = '';

  String getLoggedUserName() {
    var decodedName = _jwtDecoder.getUserName(_authService.token!);

    if (decodedName != null) {
      var userNameParts = decodedName.split(' ');

      var firstName = userNameParts[0];
      var middleName = '';

      if(userNameParts.length > 1){

        if(userNameParts[1].length > 2){
          middleName = userNameParts[1];
        }
        else if(userNameParts.length >= 2 && userNameParts[1].length <= 2){
          middleName = userNameParts[2];
        }
      }


      name = '$firstName $middleName';
    }

    return name;
  }
}
