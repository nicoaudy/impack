import 'package:flutter/material.dart';
import 'package:impack/constants.dart';

class TextArea extends StatelessWidget {
  final Function onChanged;
  final TextEditingController controller;
  const TextArea({
    Key? key,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLines: 4,
        onChanged: (val) => onChanged(val),
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Constants.outlineColor),
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Constants.outlineColor),
          ),
          filled: true,
          fillColor: Constants.focusColor,
        ),
      ),
    );
  }
}
