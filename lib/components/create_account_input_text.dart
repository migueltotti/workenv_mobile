import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccountInputText extends StatelessWidget {
  const CreateAccountInputText({
    super.key,
    required this.inputName,
    required this.width,
    required this.height,
    required this.isTextObscure,
    required this.controller,
    required this.validator,
    this.keyboardType = TextInputType.text,
  });

  final String inputName;
  final double width;
  final double height;
  final bool isTextObscure;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  final double titleHeight = 22;
  final double titleAndTextFieldSpacing = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            inputName,
            style: GoogleFonts.poppins(
              color: Color.fromRGBO(13, 27, 52, 0.75),
              fontSize: 16,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(
            height: height - (titleHeight + titleAndTextFieldSpacing),
            child: Material(
              borderRadius: BorderRadius.all(Radius.circular(7)),
              color: Color.fromRGBO(74, 166, 240, 0.25),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: TextFormField(
                  controller: controller,
                  validator: validator,
                  obscureText: isTextObscure,
                  keyboardType: keyboardType,
                  cursorRadius: Radius.circular(5),
                  decoration: InputDecoration(border: InputBorder.none),
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Color.fromRGBO(13, 27, 52, 1),
                  ),
                  cursorColor: Color.fromRGBO(13, 27, 52, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
