import 'package:flutter/material.dart';
import 'package:social_x/Models/Parameters/common_parameters.dart';
import 'package:social_x/Views/Screens/term_and_condition_screen.dart';
import 'package:social_x/Views/Widgets/login_page_widgets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyCard(
      child: SingleChildScrollView(
        child: Form(
          key: signUpFormkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create an \n Account',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              customSpacer(),
              CustomTextField(
                controller: userNameController,
                label: 'Name',
                hint: 'John doe',
                icon: Icons.person,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Enter a username';
                  } else if (value.trim().length < 3) {
                    return 'Username must be have at least 3 characters long';
                  } else {
                    return null;
                  }
                },
              ),
              customSpacer(),
              CustomTextField(
                controller: emailController,
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
                controller: phoneNumberController,
                label: 'Contact no',
                hint: '9876543210',
                icon: Icons.call,
                isPhoneNumberInput: true,
              ),
              customSpacer(),
              CustomTextField(
                controller: passwordController,
                label: 'Password',
                hint: '*************',
                icon: Icons.lock_outline,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Please enter a password';
                  } else if (value.trim().length < 8) {
                    return 'Password must be have at least 8 characters long';
                  } else {
                    return null;
                  }
                },
              ),
              const TermAndConditonWidget(),
              const LoginOrSigninScreenNavigator(
                text: "Already have an Account ?",
                buttonText: 'Sign In!',
                index: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
