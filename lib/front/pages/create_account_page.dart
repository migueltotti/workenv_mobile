// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_env_mobile/depency_injection_config/dependency_injection.dart';
import 'package:work_env_mobile/domain/enums/privacy.dart';
import 'package:work_env_mobile/domain/text_formatters/cpf_cnpj_formatter.dart';
import 'package:work_env_mobile/domain/text_formatters/date_formater.dart';
import 'package:work_env_mobile/front/components/create_account_input_text.dart';
import 'package:work_env_mobile/services/implementations/date_parser.dart';
import 'package:work_env_mobile/services/implementations/validator_service.dart';
import 'package:work_env_mobile/view_models/create_user_viewmodel.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _createUserViewModel = locator<CreateUserViewModel>();
  final _dateParser = locator<DateParser>();

  bool isPasswordVisible = false;
  final form = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpjOrCnpjController = TextEditingController();
  final _passwordController = TextEditingController();
  final _dateBirthController = TextEditingController();
  final _profilePictureController = TextEditingController();
  final _descriptionController = TextEditingController();
  Privacy accountPrivacy = Privacy.public;

  final _validationService = locator<ValidationService>();
  Map<String, String?> _fieldErrors = {};
  Map<String, String?> _fieldValues = {};

  void _validateAllFields() {
    _fieldValues = {
      'name': _nameController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
      'cpfOrCnpj': _cpjOrCnpjController.text,
    };

    final errors = _validationService.validateAll(_fieldValues);

    setState(() {
      _fieldErrors = errors;
    });
  }

  void _sendForms() async {
    _validateAllFields();

    if (_validationService.isValid(_fieldValues)) {

    final result = await _createUserViewModel.registerUser(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      cpfOrCnpj: _cpjOrCnpjController.text,
      birthDate: _dateParser.parseFromDMY(_dateBirthController.text),
      privacy: accountPrivacy,
      profilePicture: _profilePictureController.text,
      personalDescription: _descriptionController.text,
    );

    // TODO: test user register and add error handling from api

    // Avoid dispose widget problems on async functions
      if (!mounted) return;

      if (result.isSuccess) {
        _showSuccessSnackBar();

        await Future.delayed(Duration(seconds: 3));
        
        _redirectToLoginPage();
      } else {
        _showFailureSnackBar();
      }
    }
  }

  void _showSuccessSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'User created successfully, redirecting to login page!',
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
        ),
        backgroundColor: Color.fromRGBO(74, 166, 240, 1),
      ),
    );
  }

  void _showFailureSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Error on creating user, try again later.',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  void _redirectToLoginPage() {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _cpjOrCnpjController.dispose();
    _dateBirthController.dispose();
    _profilePictureController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
        child: Form(
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
                errorText: _fieldErrors['name'],
              ),
              SizedBox(height: 10),
              CreateAccountInputText(
                inputName: 'Email *',
                width: 325,
                height: 72,
                isTextObscure: false,
                controller: _emailController,
                errorText: _fieldErrors['email'],
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
                    errorText: _fieldErrors['password'],
                  ),
                  Positioned(
                    top: 23,
                    right: 0,
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
                errorText: _fieldErrors['cpfOrCpnj'],
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
                    formaters: [DateFormatter()],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Privacy',
                        style: GoogleFonts.poppins(
                          color: Color.fromRGBO(13, 27, 52, 0.65),
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        width: 170,
                        height: 51,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          color: Color.fromRGBO(74, 166, 240, 0.25),
                        ),
                        child: DropdownButton<String>(
                          underline: Container(),
                          value: accountPrivacy.toString(),
                          menuWidth: 170,
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          elevation: 3,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color.fromRGBO(13, 27, 52, 1),
                          ),
                          alignment: AlignmentDirectional.centerEnd,
                          icon: Icon(Icons.arrow_drop_down_sharp, size: 30),
                          items:
                              <String>[
                                'public',
                                'private',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value.toString()),
                                );
                              }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              accountPrivacy = Privacy.fromStringValue(
                                newValue!,
                              );
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              CreateAccountInputText(
                inputName: 'Profile picture',
                width: 325,
                height: 72,
                isTextObscure: false,
                controller: _profilePictureController,
              ),
              SizedBox(height: 10),
              CreateAccountInputText(
                inputName: 'Talk about yourself!',
                width: 325,
                height: 116,
                isTextObscure: false,
                isMultiline: true,
                controller: _descriptionController,
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
                  onPressed: () => {_sendForms()},
                  child: Text(
                    'Sign up',
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
      ),
    );
  }
}
