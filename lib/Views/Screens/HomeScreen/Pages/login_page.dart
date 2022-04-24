import 'package:flutter/material.dart';
import 'package:social_x/Controller/Functions/user_signin_and_signout.dart';
import 'package:social_x/Models/Parameters/common_parameters.dart';
import 'package:social_x/Views/Screens/password_reset_screen.dart';
import 'package:social_x/Views/Widgets/login_page_widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyCard(
      child: SingleChildScrollView(
        child: Form(
          key: loginFormkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'SignIn into your \n Account',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              customSpacer(),
              CustomTextField(
                controller: loginEmailController,
                label: 'Email',
                hint: 'johndoe@gmail.com',
                icon: Icons.mail,
                validator: (value) {
                  if (emailError == null) {
                    if (RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!)) {
                      return null;
                    } else {
                      return 'Enter valid email';
                    }
                  } else {
                    return emailError;
                  }
                },
              ),
              customSpacer(),
              CustomTextField(
                controller: loginPasswordController,
                label: 'Password',
                hint: 'Password',
                icon: Icons.lock_outline,
                validator: (value) {
                  if (passWordError == null) {
                    if (value!.trim().isEmpty) {
                      return 'Enter password';
                    } else if (value.trim().length < 8) {
                      return 'Enter a valid password (Min. 8 characters)';
                    } else {
                      return null;
                    }
                  } else {
                    return passWordError;
                  }
                },
              ),
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      // Go to password reset screen.

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ResetPasswordScreen()));
                    },
                    child: const Text(
                      'Forgot Password ?',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const Center(child: Text('Login with')),
              customSpacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      // Login with google.

                      googleLogin(context);
                    },
                    icon: Image.asset(
                      'assets/images/google.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Login with facebook

                      facebookLogin(context);
                    },
                    icon: Image.asset(
                      'assets/images/facebook.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
              const LoginOrSigninScreenNavigator(
                text: "Don't have an Account ?",
                buttonText: 'Register Now',
                index: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
