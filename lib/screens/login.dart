// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:topcoder_hackathon/services/login_service.dart';
import 'package:topcoder_hackathon/widgets/buttons.dart';

// The main login screen widget containing UI elements for user authentication.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  bool passwordHidden = true;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool loginLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                'Are you sure you want to exit?',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text(
                    'No',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text(
                    'Yes',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        child: Scaffold(
          body: Stack(
            children: [
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                child: ListView(
                  children: [
                    SvgPicture.asset(
                      'assets/images/login_illustration.svg',
                      height: MediaQuery.of(context).size.height * 0.35,
                    ),
                    Form(
                      key: _loginFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.085,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.004,
                          ),
                          Text(
                            'It\'s good to see you again!',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.045,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.009,
                          ),
                          UsernameLoginTextField(context),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          PasswordLoginTextField(context),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                if (_loginFormKey.currentState!.validate()) {
                                  setState(() {
                                    loginLoading = true;
                                  });
                                  login(
                                    context,
                                    usernameController.text,
                                    passwordController.text,
                                  );
                                  Future.delayed(const Duration(seconds: 1),
                                      () {
                                    setState(() {
                                      loginLoading = false;
                                    });
                                  });
                                }
                              },
                              child: LoginButton(loginLoading: loginLoading),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Center(
                      child: Text(
                        'Or, don\'t have an account yet?',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.039,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    const Center(
                      child: SignUpButton(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Custom TextFormField for the username with specific styling and validation logic
  TextFormField UsernameLoginTextField(BuildContext context) {
    return TextFormField(
      controller: usernameController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please provide a valid username';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02),
        border: UnderlineInputBorder(
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.02),
          borderSide: const BorderSide(
            width: 0.9,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.02),
          borderSide: BorderSide(
            width: 0.9,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        hintText: 'Username',
        hintStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.044,
        ),
        prefixIcon: Icon(
          Icons.person,
          size: MediaQuery.of(context).size.width * 0.06,
        ),
      ),
    );
  }

// Custom TextFormField for the password with specific styling and validation logic
  TextFormField PasswordLoginTextField(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      validator: (value) {
        if (value == null || value.length < 6) {
          return 'Please provide a valid password of at least 6 characters';
        } else {
          return null;
        }
      },
      obscureText: passwordHidden,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02),
        border: UnderlineInputBorder(
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.02),
          borderSide: const BorderSide(
            width: 0.9,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 0.9,
            color: Colors.grey,
          ),
        ),
        hintText: 'Password',
        hintStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.044,
        ),
        prefixIcon: Icon(
          Icons.lock,
          size: MediaQuery.of(context).size.width * 0.06,
        ),
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              passwordHidden = !passwordHidden;
            });
          },
          child: Icon(
            passwordHidden ? Icons.visibility_off : Icons.remove_red_eye,
            size: MediaQuery.of(context).size.width * 0.06,
            color: passwordHidden
                ? Colors.grey
                : Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
