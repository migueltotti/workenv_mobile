import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_env_mobile/components/login_input_text_field.dart';
import 'package:work_env_mobile/components/social_media_icon_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isFormValid = true;
  double _rightPosition = 6.0;
  final double _topPosition = 5.0;

  void _signIn() {
    isFormValid = _formKey.currentState?.validate() ?? false;

    if (isFormValid) {
      // Handle login logic here
      log('Form is valid, sending data...');
      log('Email: ${emailController.text}');
      log('Password: ${passwordController.text}');

      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // TODO: Study the possibility to get the validation error messages from the Form and create a another widget to display it.

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.asset(
              'assets/images/login_page_img_white_theme.png',
              height: 350,
            ),
            Text(
              'Login',
              style: GoogleFonts.spaceGrotesk(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                letterSpacing: -0.5,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(height: 20),
            LoginInputTextField(
              inputName: 'Email',
              controller: emailController,
              isObscureText: false,
              validator: (value) {
                if (value == null || value.isEmpty || !value.contains('@')) {
                  return 'Please enter a valid email';
                }

                return null;
              },
            ),
            SizedBox(height: 12),
            Stack(
              children: [
                LoginInputTextField(
                  inputName: 'Password',
                  controller: passwordController,
                  isObscureText: !isPasswordVisible,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid password';
                    }
                    return null;
                  },
                ),
                Positioned(
                  right: _rightPosition,
                  top: _topPosition,
                  child: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? FontAwesomeIcons.eyeSlash
                          : FontAwesomeIcons.eye,
                      color: Color.fromRGBO(13, 27, 52, 1),
                      size: 20.0,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                        _rightPosition = isPasswordVisible ? 8.0 : 7.0;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 35, 0),
                  child: Text(
                    'forgot your password?',
                    style: GoogleFonts.poppins(
                      color: const Color.fromRGBO(74, 166, 240, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1,
                      decorationColor: const Color.fromRGBO(74, 166, 240, 1),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              // Remember me checkbox
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              height: 50,
              child: Material(
                color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Checkbox(
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = !rememberMe;
                          });
                        },
                        fillColor: WidgetStateProperty.resolveWith<Color>((
                          Set<WidgetState> states,
                        ) {
                          return Color.fromRGBO(49, 61, 82, 1);
                        }),
                        checkColor: Color.fromRGBO(74, 166, 240, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    Text(
                      'remember me?',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                onPressed: () => _signIn(),
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
            //SizedBox(height: 15),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'don`t have an account?',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/create-account');
                      },
                      child: Text(
                        'create one!',
                        style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(74, 166, 240, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                          decorationColor: const Color.fromRGBO(
                            74,
                            166,
                            240,
                            1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'or sign in with other plataformt',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SocialMediaIconButton(icon: FontAwesomeIcons.google),
                SocialMediaIconButton(icon: FontAwesomeIcons.facebook),
                SocialMediaIconButton(icon: FontAwesomeIcons.instagram),
                SocialMediaIconButton(icon: FontAwesomeIcons.linkedin),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
