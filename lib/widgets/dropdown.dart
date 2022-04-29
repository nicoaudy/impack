import 'package:flutter/material.dart';
import 'package:impack/constants.dart';

class Dropdown extends StatelessWidget {
  final String selected;
  final List<DropdownMenuItem<String>> lists;
  final Function onChange;

  const Dropdown({
    Key? key,
    required this.selected,
    required this.lists,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Constants.outlineColor),
          borderRadius: BorderRadius.circular(6),
          color: Constants.focusColor,
        ),
        child: DropdownButtonHideUnderline(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: DropdownButton(
              value: selected,
              items: lists,
              onChanged: (val) => onChange(val),
              iconSize: 36,
              icon: Icon(
                Icons.arrow_drop_down,
                color: Constants.placeholderColor,
              ),
              isExpanded: true,
            ),
          ),
        ),
      ),
    );
  }
}
