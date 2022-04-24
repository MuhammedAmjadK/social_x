import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:social_x/Models/Parameters/common_parameters.dart';

class BodyCard extends StatelessWidget {
  const BodyCard({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: child,
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    required this.hint,
    required this.icon,
    this.isPhoneNumberInput = false,
    this.controller,
    this.validator,
  }) : super(key: key);

  final String label, hint;
  final IconData icon;
  final bool isPhoneNumberInput;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        isPhoneNumberInput
            ? InternationalPhoneNumberInput(
                onInputChanged: (number) {},
                textFieldController: controller,
                initialValue: PhoneNumber(isoCode: 'IN'),
                spaceBetweenSelectorAndTextField: 0,
                selectorConfig: const SelectorConfig(),
                inputDecoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  suffixIcon: Icon(
                    icon,
                    color: Colors.red,
                  ),
                ),
              )
            : TextFormField(
                controller: controller,
                validator: validator,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  suffixIcon: Icon(
                    icon,
                    color: Colors.red,
                  ),
                ),
              ),
      ],
    );
  }
}

Widget customSpacer() {
  return const SizedBox(
    height: 20,
  );
}

class LoginOrSigninScreenNavigator extends StatelessWidget {
  const LoginOrSigninScreenNavigator(
      {Key? key,
      required this.text,
      required this.buttonText,
      required this.index})
      : super(key: key);

  final String text, buttonText;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        TextButton(
          onPressed: () {
            switch (index) {
              case 0:
                // Go to SignUp page
                tabController.index = 1;
                break;
              case 1:
                // Go to Login page
                tabController.index = 0;
                break;
              default:
            }
          },
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
