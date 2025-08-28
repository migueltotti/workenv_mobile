import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_env_mobile/depency_injection_config/dependency_injection.dart';
import 'package:work_env_mobile/domain/entities/user/user_request.dart';
import 'package:work_env_mobile/domain/entities/user/user_response.dart';
import 'package:work_env_mobile/domain/enums/privacy.dart';
import 'package:work_env_mobile/domain/result/result.dart';
import 'package:work_env_mobile/services/encrypt_service.dart';
import 'package:work_env_mobile/services/user_service.dart';

class TesteRegisterUser extends StatefulWidget {
  const TesteRegisterUser({super.key});

  @override
  State<TesteRegisterUser> createState() => _TesteRegisterUserState();
}

class _TesteRegisterUserState extends State<TesteRegisterUser> {
  final _userService = locator<UserService>();
  final _cryptoService = locator<CryptoService>();

  String response = 'Teste de criação de usuário';

  void callApi() async {
    var result = await _userService
        .createUser(
          UserRequest(
            name: 'Miguel Totti',
            email: 'migueltotti2@gmail.com',
            password: _cryptoService.encrypt('miguel2005#Dkawdkas'),
            cpfCnpj: '909.909.902-90',
            dateBirth: DateTime.now().subtract(Duration(days: 10)),
            profilePicture: 'sla qualuqer merda',
            personalDescription: 'qualquer merda ao quadrado #',
            privacy: Privacy.public,
          ),
        );

    if(result.isSuccess){
      log('Usuário criado com sucesso!');
      log(result.value.toString());
      setState(() {
        response = result.value!.name;
      });
    }
    else{
      log('Erro ao criar usuário!');
      log(result.error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Teste de criação de usuário',
              style: GoogleFonts.poppins(fontSize: 20),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                log('api called!');
                callApi();
              },
              child: Text('Criar usuário'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                log('testing connection!');
                _userService.testConnection();
              },
              child: Text('Testar Conectividade'),
            ),
            SizedBox(height: 30),
            Text(response, style: GoogleFonts.poppins(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
