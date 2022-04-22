import 'package:flutter/material.dart';
import 'package:social_x/Widgets/login_page_widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyCard(
      child: SingleChildScrollView(
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
            const CustomTextField(
              label: 'Email',
              hint: 'johndoe@gmail.com',
              icon: Icons.mail,
            ),
            customSpacer(),
            const CustomTextField(
              label: 'Password',
              hint: 'Password',
              icon: Icons.lock_outline,
            ),
            Row(
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // password reset function.
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
    );
  }
}
