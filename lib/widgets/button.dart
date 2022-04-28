import 'package:flutter/material.dart';
import 'package:impack/constants.dart';

class Button extends StatelessWidget {
  final Function onTap;
  final String title;
  const Button({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Constants.buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: GestureDetector(
          onTap: () => onTap,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
