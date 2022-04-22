import 'package:flutter/material.dart';
import 'package:social_x/Parameters/common_parameters.dart';
import 'package:social_x/Widgets/login_page_widgets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyCard(
      child: SingleChildScrollView(
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
            const CustomTextField(
              label: 'Name',
              hint: 'John doe',
              icon: Icons.person,
            ),
            customSpacer(),
            const CustomTextField(
              label: 'Email',
              hint: 'johndoe@gmail.com',
              icon: Icons.mail,
            ),
            customSpacer(),
            const CustomTextField(
              label: 'Contact no',
              hint: '9876543210',
              icon: Icons.call,
              isPhoneNumberInput: true,
            ),
            customSpacer(),
            const CustomTextField(
              label: 'Password',
              hint: '*************',
              icon: Icons.lock_outline,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: termAndConditionAccepted,
                  onChanged: (value) {
                    termAndConditionAccepted = !termAndConditionAccepted;
                  },
                  side: const BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                ),
                const Text('I agree with'),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'term & condition',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                    ),
                  ),
                ),
              ],
            ),
            const LoginOrSigninScreenNavigator(
              text: "Already have an Account ?",
              buttonText: 'Sign In!',
              index: 1,
            )
          ],
        ),
      ),
    );
  }
}
