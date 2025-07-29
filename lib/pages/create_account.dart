import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_env_mobile/components/create_account_input_text.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Create Account',
            style: GoogleFonts.spaceGrotesk(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 36,
              letterSpacing: -0.5,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
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
          SizedBox(height: 10),
          CreateAccountInputText(
            inputName: 'Name *',
            width: 325,
            height: 72,
            isPasswordField: false,
          ),
          SizedBox(height: 10),
          CreateAccountInputText(
            inputName: 'Email *',
            width: 325,
            height: 72,
            isPasswordField: false,
          ),
          SizedBox(height: 10),
          CreateAccountInputText(
            inputName: 'Password *',
            width: 325,
            height: 72,
            isPasswordField: true,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CreateAccountInputText(
                inputName: 'Date birth',
                width: 150,
                height: 72,
                isPasswordField: false,
              ),
              CreateAccountInputText(
                inputName: 'Profile image',
                width: 150,
                height: 72,
                isPasswordField: false,
              ),
            ],
          ),
          SizedBox(height: 10),
          CreateAccountInputText(
            inputName: 'Talk about yourself!',
            width: 325,
            height: 116,
            isPasswordField: false,
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
              onPressed: () {},
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
                onPressed:
                    () => Navigator.pushReplacementNamed(context, '/login'),
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
    );
  }
}
