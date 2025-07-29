import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginInputTextField extends StatefulWidget {
  const LoginInputTextField({super.key, required this.inputName});

  final String inputName;

  @override
  State<LoginInputTextField> createState() => _LoginInputTextFieldState();
}

class _LoginInputTextFieldState extends State<LoginInputTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(11)),
        color: Colors.white,
      ),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(11)),
        color: Color.fromRGBO(74, 166, 240, 0.25),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: TextField(
            cursorRadius: Radius.circular(5),
            maxLines: 1,
            decoration: InputDecoration(
              border: InputBorder.none,
              label: Text(
                widget.inputName,
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 20,
                  color: Color.fromRGBO(13, 27, 52, 0.5),
                ),
              ),
            ),
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Color.fromRGBO(13, 27, 52, 1),
            ),
            cursorColor: Color.fromRGBO(13, 27, 52, 1),
          ),
        ),
      ),
    );
  }
}
