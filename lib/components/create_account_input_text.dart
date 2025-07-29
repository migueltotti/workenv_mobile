import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccountInputText extends StatelessWidget {
  const CreateAccountInputText({
    super.key,
    required this.inputName,
    required this.width,
    required this.height,
    required this.isPasswordField,
  });

  final String inputName;
  final double width;
  final double height;
  final bool isPasswordField;

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
                child: Stack(
                  alignment:
                      isPasswordField == true
                          ? Alignment.centerRight
                          : Alignment(10, 10),
                  children: [
                    TextField(
                      cursorRadius: Radius.circular(5),
                      maxLines: 1,
                      decoration: InputDecoration(border: InputBorder.none),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Color.fromRGBO(13, 27, 52, 1),
                      ),
                      cursorColor: Color.fromRGBO(13, 27, 52, 1),
                    ),
                    Padding( // TODO: change to Statefull Widget and add show-password icon change with button
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: FaIcon(
                        FontAwesomeIcons.eyeSlash,
                        color:
                            isPasswordField == true
                                ? Color.fromRGBO(13, 27, 52, 0.85)
                                : Colors.white,
                        size: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
