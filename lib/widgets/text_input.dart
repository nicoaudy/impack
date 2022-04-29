import 'package:flutter/material.dart';
import 'package:impack/constants.dart';

class TextInput extends StatelessWidget {
  final Function onChanged;
  final String hintText;
  final TextEditingController controller;
  const TextInput({
    Key? key,
    required this.onChanged,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
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
          hintText: hintText,
          suffixIcon: Icon(
            Icons.search,
            color: Constants.placeholderColor,
          ),
          filled: true,
          fillColor: Constants.focusColor,
        ),
      ),
    );
  }
}
