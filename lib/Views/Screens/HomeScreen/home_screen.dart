import 'package:flutter/material.dart';
import 'package:social_x/Controller/Functions/user_signin_and_signout.dart';
import 'package:social_x/Models/Parameters/common_parameters.dart';
import 'package:social_x/Views/Screens/HomeScreen/Pages/login_page.dart';
import 'package:social_x/Views/Screens/HomeScreen/Pages/signup_page.dart';
import 'package:social_x/Views/Widgets/homescreen_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<String> bottomText = ['LOGIN', 'REGISTER'];

  bool isLoading = false;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 22,
                letterSpacing: 1,
              ),
              children: [
                TextSpan(
                  text: 'Social',
                ),
                TextSpan(
                  text: 'X',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
        ),
        flexibleSpace: Container(
          color: Colors.red,
          height: 90,
        ),
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        bottom: TabBar(
          controller: tabController,
          labelPadding: EdgeInsets.zero,
          indicatorColor: Colors.white.withOpacity(0),
          tabs: [
            TabWidget(
              isSelected: tabController.index == 0,
              label: 'LOGIN',
            ),
            TabWidget(
              isSelected: tabController.index == 1,
              label: 'SIGN UP',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          LoginPage(),
          SignUpPage(),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          passWordError = null;
          emailError = null;

          if (tabController.index == 0) {
            if (loginFormkey.currentState!.validate()) {
              setState(() {
                isLoading = true;
              });
              await loginUser(loginEmailController.text,
                  loginPasswordController.text, context);
              setState(() {
                isLoading = false;
              });
            }
          } else {
            if (signUpFormkey.currentState!.validate()) {
              if (termAndConditionAccepted) {
                setState(() {
                  isLoading = true;
                });

                await registerUser(
                    userNameController.text,
                    emailController.text,
                    passwordController.text,
                    phoneNumberController.text,
                    context);

                setState(() {
                  isLoading = false;
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Read and Accept term & conditions.')));
              }
            }
          }
        },
        child: Container(
          height: 50,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(29), topRight: Radius.circular(29)),
          ),
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  bottomText[tabController.index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
        ),
      ),
    );
  }
}
