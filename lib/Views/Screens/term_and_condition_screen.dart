import 'package:flutter/material.dart';
import 'package:social_x/Models/Parameters/common_parameters.dart';

class TermAndContitionScreen extends StatelessWidget {
  const TermAndContitionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Term & Conditions'),
      ),
    );
  }
}

class TermAndConditonWidget extends StatefulWidget {
  const TermAndConditonWidget({Key? key}) : super(key: key);

  @override
  State<TermAndConditonWidget> createState() => _TermAndConditonWidgetState();
}

class _TermAndConditonWidgetState extends State<TermAndConditonWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: termAndConditionAccepted,
          onChanged: (value) {
            setState(() {
              termAndConditionAccepted = !termAndConditionAccepted;
            });
          },
          side: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        const Text('I agree with'),
        TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TermAndContitionScreen()));
          },
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
    );
  }
}
