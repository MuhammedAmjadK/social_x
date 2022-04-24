import 'package:flutter/material.dart';
import 'package:social_x/Controller/Functions/user_signin_and_signout.dart';
import 'package:social_x/Models/Parameters/common_parameters.dart';
import 'package:social_x/Views/Widgets/login_page_widgets.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: passwordResetFormkey,
              child: CustomTextField(
                controller: passwordResetEmailController,
                label: 'Email',
                hint: 'johndoe@gmail.com',
                icon: Icons.mail,
                validator: (value) {
                  if (RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!)) {
                    return null;
                  } else {
                    return 'Enter valid email';
                  }
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // reset password

              if (passwordResetFormkey.currentState!.validate()) {
                resetPassword(passwordResetEmailController.text, context);
              }
            },
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }
}
