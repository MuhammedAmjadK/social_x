import 'package:flutter/material.dart';

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
