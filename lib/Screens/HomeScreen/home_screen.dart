import 'package:flutter/material.dart';
import 'package:social_x/Parameters/common_parameters.dart';
import 'package:social_x/Screens/HomeScreen/Pages/login_page.dart';
import 'package:social_x/news_screen.dart';
import 'package:social_x/Screens/HomeScreen/Pages/signup_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<String> bottomText = ['LOGIN', 'REGISTER'];

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
          height: 80,
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
        onTap: () {
          switch (tabController.index) {
            case 0:
              // Login User
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const NewsScreen()));
              break;
            case 1:
              // Register User
              break;
            default:
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
          child: Text(
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

class TabWidget extends StatelessWidget {
  const TabWidget({
    Key? key,
    required this.isSelected,
    required this.label,
  }) : super(key: key);

  final bool isSelected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? Colors.red : Colors.white,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
          color: isSelected ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}

class BodyCard extends StatelessWidget {
  const BodyCard({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: child,
      ),
    );
  }
}
