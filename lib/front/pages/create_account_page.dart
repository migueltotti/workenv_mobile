// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_env_mobile/domain/text_formatters/cpf_cnpj_formatter.dart';
import 'package:work_env_mobile/domain/text_formatters/date_formater.dart';
import 'package:work_env_mobile/front/components/create_account_input_text.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool isPasswordVisible = false;
  final form = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpjOrCnpjController = TextEditingController();
  final _passwordController = TextEditingController();
  final _dateBirthController = TextEditingController();
  final _profilePictureController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_]).{8,30}$');
  final _cpfCnpjRegex = RegExp(
    r'^(\d{3}\.\d{3}\.\d{3}-\d{2}|\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2})$',
  );

  void _sendForms() {
    if (form.currentState!.validate()) {
      log('Form is valid, sending data...');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Processing Data')));
      // Make API call and create account
      // After successful account creation, show snackbar and navigate to the next page
      Future.wait([
        // Simulate API call
        Future.delayed(Duration(seconds: 2)),
      ]);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Account created successfully!')));
    } else {
      log('Form is invalid, not sending data...');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields correctly')),
        // TODO: learn about SnackBar and customize it.
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _dateBirthController.dispose();
    _profilePictureController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  final _dataSeletorController = TextEditingController();

  Future<void> _selecionarData(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      locale: Locale('pt', 'BR'), // Português brasileiro
    );

    if (picked != null) {
      setState(() {
        _dataSeletorController.text =
            '${picked.day.toString().padLeft(2, '0')}/'
            '${picked.month.toString().padLeft(2, '0')}/'
            '${picked.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Form(
        // TODO: learn about Form and how to customize the error messages.
        key: form,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          children: [
            Center(
              child: Text(
                'Create Account',
                style: GoogleFonts.spaceGrotesk(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  letterSpacing: -0.5,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 230,
                child: Text(
                  'Start organizing your routine the way you`ve always wanted.',
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    letterSpacing: -0.5,
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 10),
            CreateAccountInputText(
              inputName: 'Name *',
              width: 325,
              height: 72,
              isTextObscure: false,
              controller: _nameController,
              validator: (name) {
                if (name == null || name.isEmpty)
                  return 'Name must be not null or empty!';
                if (name.length < 3) return 'Name must have at least 3 chars!';
                if (name.trim()[0] == name.trim()[0].toLowerCase())
                  return 'Name must have the first letter in upper case!';
                return null;
              },
            ),
            SizedBox(height: 10),
            CreateAccountInputText(
              inputName: 'Email *',
              width: 325,
              height: 72,
              isTextObscure: false,
              controller: _emailController,
              validator: (email) {
                if (email == null || email.isEmpty)
                  return 'Email must be not null or empty!';
                if (!email.contains('@'))
                  return 'Email must be in the corret format, missing `@`';
                return null;
              },
            ),
            SizedBox(height: 10),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                CreateAccountInputText(
                  inputName: 'Password *',
                  width: 335,
                  height: 72,
                  isTextObscure: !isPasswordVisible,
                  controller: _passwordController,
                  validator: (pw) {
                    if (pw == null || pw.isEmpty)
                      return 'Password must be not null or empty';
                    if (!_passwordRegex.hasMatch(pw)) {
                      return 'Password must be 8-30 chars, include upper, lower, and special character';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: TextButton(
                    onPressed:
                        () => setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        }),
                    child: FaIcon(
                      isPasswordVisible == false
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      size: 17,
                      color: Color.fromRGBO(13, 27, 52, 0.75),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            CreateAccountInputText(
              inputName: 'CPF or CNPJ *',
              width: 325,
              height: 72,
              isTextObscure: false,
              controller: _cpjOrCnpjController,
              validator: (cpfOrCnpj) {
                if (cpfOrCnpj == null || cpfOrCnpj.isEmpty)
                  return 'Cpf or Cnpj must be not null or empty!';
                if (!_cpfCnpjRegex.hasMatch(cpfOrCnpj))
                  return 'Cpf or Cnpj must be in the corret format!';
                return null;
              },
              formaters: [CpfCnpjFormatter()],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CreateAccountInputText(
                  inputName: 'Date birth',
                  width: 150,
                  height: 72,
                  isTextObscure: false,
                  keyboardType: TextInputType.number,
                  controller: _dateBirthController,
                  validator: (date) {
                    return null;
                  },
                  formaters: [DateFormatter()],
                ),
                CreateAccountInputText(
                  inputName: 'Profile picture',
                  width: 150,
                  height: 72,
                  isTextObscure: false,
                  controller: _profilePictureController,
                  validator: (image) {
                    return null;
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            CreateAccountInputText(
              inputName: 'Talk about yourself!',
              width: 325,
              height: 116,
              isTextObscure: false,
              isMultiline: true,
              controller: _descriptionController,
              validator: (about) {
                if ((about != null || about!.isNotEmpty) && about.length < 30)
                  return 'About must be not null or empty and have at least 30 chars!';
                return null;
              },
            ),
            SizedBox(height: 20),
            SizedBox(
              // SignIn Button
              width: 325,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(13, 27, 52, 0.85),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
                onPressed: () => {_sendForms(), dispose()},
                child: Text(
                  'Sign in',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    letterSpacing: -0.5,
                    color: Color.fromRGBO(74, 166, 240, 1),
                  ),
                ),
              ),
            ),
            //SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'already have an account?',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                    letterSpacing: -0.5,
                    decoration: TextDecoration.none,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                    dispose();
                  },
                  child: Text(
                    'sign in!',
                    style: GoogleFonts.poppins(
                      color: Color.fromRGBO(74, 166, 240, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      letterSpacing: -0.5,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      decorationColor: Color.fromRGBO(74, 166, 240, 1),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
