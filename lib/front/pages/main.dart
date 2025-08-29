import 'package:flutter/material.dart';
import 'package:work_env_mobile/depency_injection_config/dependency_injection.dart';
import 'package:work_env_mobile/front/pages/my_app.dart';

void main() {
  setupDepencyInjection();
  runApp(const MyApp());
}
