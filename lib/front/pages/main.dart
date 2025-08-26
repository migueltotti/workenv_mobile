import 'package:flutter/material.dart';
import 'package:work_env_mobile/depency_injection_config/dependency_injection.dart';
import 'package:work_env_mobile/front/pages/create_account_page.dart';
import 'package:work_env_mobile/front/pages/home_page.dart';
import 'package:work_env_mobile/front/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupDepencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(textTheme: GoogleFonts.spaceGroteskTextTheme()),
      home: const CreateAccountPage(),
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/create-account': (context) => CreateAccountPage(),
      },
    );
  }
}
