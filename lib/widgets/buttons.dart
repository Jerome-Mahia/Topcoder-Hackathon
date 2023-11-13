import 'package:flutter/material.dart';
import 'package:topcoder_hackathon/services/logout_service.dart';

// This file contains classes that define reusable buttons for signing up.
class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.height * 0.02),
        ),
        child: Center(
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.049,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.loginLoading,
  });

  final bool loginLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        border: Border.all(
          color:
              Theme.of(context).colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.height *
                0.02),
      ),
      child: Center(
        child: loginLoading
            ? SizedBox(
                height: 30.0,
                width: 30.0,
                child: CircularProgressIndicator(
                  color: Theme.of(context)
                      .colorScheme
                      .secondary,
                ),
              )
            : Text(
                'Login',
                style: TextStyle(
                  fontSize: MediaQuery.of(context)
                          .size
                          .width *
                      0.049,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context)
                      .colorScheme
                      .secondary,
                ),
              ),
      ),
    );
  }
}


class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.height * 0.02),
        child: InkWell(
          onTap: () {
            logout(context);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.021,
                horizontal: MediaQuery.of(context).size.height * 0.021),
            child: Center(
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: MediaQuery.of(context).size.width * 0.049,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
