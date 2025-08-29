import 'package:flutter/material.dart';
import 'package:work_env_mobile/depency_injection_config/dependency_injection.dart';
import 'package:work_env_mobile/services/abstractions/jwt_decoder.dart';
import 'package:work_env_mobile/services/implementations/auth_service.dart';

class AfterLoginPage extends StatefulWidget {
  const AfterLoginPage({super.key});

  @override
  State<AfterLoginPage> createState() => _AfterLoginPageState();
}

class _AfterLoginPageState extends State<AfterLoginPage> {
  final _authService = locator<AuthService>();
  final _jwtDecoder = locator<JwtDecoderAbstraction>();

  String _token = '';
  String _username = '';
  String _email = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _token = _authService.token ?? 'token invalido';
    _username = _jwtDecoder.getUserName(_token)!;
    _email = _jwtDecoder.getEmail(_token)!;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Token:"),
            Text(_token),
            SizedBox(height: 50),
            Text("Username:"),
            TextFormField(readOnly: true, initialValue: _username),
            SizedBox(height: 10),
            Text("Email:"),
            TextFormField(readOnly: true, initialValue: _email),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(74, 166, 240, 1),
                foregroundColor: Colors.white, // Cor de fundo
              ),
              child: Text(
                'Voltar a pagina de login',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
