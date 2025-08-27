import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccountInputText extends StatelessWidget {
  const CreateAccountInputText({
    super.key,
    required this.inputName,
    required this.width,
    required this.height,
    required this.isTextObscure,
    required this.controller,
    this.errorText = null,
    this.isMultiline = false,
    this.keyboardType = TextInputType.text,
    this.formaters,
  });

  final String inputName;
  final double width;
  final double height;
  final bool isTextObscure;
  final bool isMultiline;
  final TextEditingController controller;
  final String? errorText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? formaters;

  final double titleHeight = 22;
  final double titleAndTextFieldSpacing = 1;

  Widget getInputField() {
    Widget inputField;
    final inputFormatters = formaters ?? <TextInputFormatter>[];

    if (isMultiline) {
      inputField = SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: TextFormField(
          controller: controller,
          obscureText: isTextObscure,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          minLines: 1,
          cursorRadius: Radius.circular(5),
          decoration: InputDecoration(border: InputBorder.none),
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Color.fromRGBO(13, 27, 52, 1),
          ),
          cursorColor: Color.fromRGBO(13, 27, 52, 1),
          inputFormatters: inputFormatters,
        ),
      );
    } else {
      inputField = TextFormField(
        controller: controller,
        obscureText: isTextObscure,
        keyboardType: keyboardType,
        maxLines: 1,
        cursorRadius: Radius.circular(5),
        decoration: InputDecoration(border: InputBorder.none),
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: Color.fromRGBO(13, 27, 52, 1),
        ),
        cursorColor: Color.fromRGBO(13, 27, 52, 1),
        inputFormatters: inputFormatters,
      );
    }

    return inputField;
  }

  Widget showInputError() {
    if (errorText != null) {
      return Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Text(
          errorText!,
          style: GoogleFonts.poppins(color: Colors.redAccent, fontSize: 12),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height:
          errorText == null
              ? height
              : errorText!.length <= 35
              ? height + 15
              : height + 32,
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
              color: Color.fromRGBO(13, 27, 52, 0.65),
              fontSize: 15,
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
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: getInputField(),
              ),
            ),
          ),
          showInputError(),
        ],
      ),
    );
  }
}
