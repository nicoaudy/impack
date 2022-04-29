import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:impack/constants.dart';

class DatetimePicker extends StatelessWidget {
  final String initialValue;
  final Function onSaved;
  const DatetimePicker({
    Key? key,
    required this.initialValue,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DateTimePicker(
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
        type: DateTimePickerType.dateTime,
        dateMask: 'dd-MMM-yyyy HH:mm',
        initialValue: initialValue,
        firstDate: DateTime(DateTime.now().year),
        lastDate: DateTime(DateTime.now().year + 5),
        onSaved: (val) => onSaved(val),
      ),
    );
  }
}
