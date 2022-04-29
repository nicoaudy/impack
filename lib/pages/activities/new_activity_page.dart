import 'dart:async';
import 'package:flutter/material.dart';
import 'package:impack/constants.dart';
import 'package:impack/networking.dart';
import 'package:impack/widgets/label.dart';
import 'package:impack/widgets/button.dart';
import 'package:impack/widgets/dropdown.dart';
import 'package:impack/widgets/text_area.dart';
import 'package:impack/widgets/text_input.dart';
import 'package:impack/widgets/datetime_picker.dart';

class NewActivityPage extends StatefulWidget {
  const NewActivityPage({Key? key}) : super(key: key);

  @override
  State<NewActivityPage> createState() => _NewActivityPageState();
}

class _NewActivityPageState extends State<NewActivityPage> {
  final todos = ['Meeting', 'Phone Call'];
  final objectives = ['New Order', 'Invoice', 'New Leads'];

  bool loading = false;
  String activityType = 'Meeting';
  String? institution;
  String objective = 'New Order';
  String when = DateTime.now().toString();
  String? remarks;

  void _showToast(BuildContext context, String message, bool success) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        backgroundColor: !success ? Colors.red[200] : Constants.primaryColor,
        content: Text(
          message,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Colors.white,
          onPressed: scaffold.hideCurrentSnackBar,
        ),
      ),
    );
  }

  submit() async {
    setState(() {
      loading = true;
    });

    if (activityType.isEmpty ||
        institution == null ||
        objective.isEmpty ||
        when.isEmpty ||
        remarks == null) {
      // Simple toast validation
      // only client side validation for now
      _showToast(
        context,
        "Whops👻! \nPlease check your input! We need backend validation also😂",
        false,
      );
      setState(() {
        loading = false;
      });

      return;
    }

    final response = await Networking().postActivity(
      activityType,
      institution!,
      when,
      objective,
      remarks!,
    );

    if (response['status'] == 'OK') {
      _showToast(
        context,
        "👋 Data has been submitted successfully",
        true,
      );

      // Wait a bit before pop
      Timer(const Duration(seconds: 2), () => Navigator.of(context).pop());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          "New Activity",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          const Label(title: "What do you want to do?"),
          Dropdown(
            selected: activityType.toString(),
            lists: todos.map((item) {
              return DropdownMenuItem(value: item, child: Text(item));
            }).toList(),
            onChange: (val) {
              setState(() {
                activityType = val.toString();
              });
            },
          ),
          const SizedBox(height: 10),
          const Label(title: "Who do you want to meet/call?"),
          TextInput(
            onChanged: (val) {
              setState(() {
                institution = val;
              });
            },
            hintText: "CV Anugrah Jaya",
          ),
          const SizedBox(height: 10),
          Label(title: "When do you want to meet/call ${institution ?? ''}?"),
          DatetimePicker(
            initialValue: when,
            onSaved: (val) {
              setState(() {
                when = val;
              });
            },
          ),
          const SizedBox(height: 10),
          Label(title: "Why do you want to meet/call ${institution ?? ''}?"),
          Dropdown(
            selected: objective.toString(),
            lists: objectives.map((item) {
              return DropdownMenuItem(value: item, child: Text(item));
            }).toList(),
            onChange: (val) {
              setState(() {
                objective = val.toString();
              });
            },
          ),
          const SizedBox(height: 10),
          const Label(title: "Could you describe it more details?"),
          TextArea(onChanged: (val) {
            setState(() {
              remarks = val;
            });
          }),
          Button(onTap: () => submit(), title: "Submit", loading: loading),
        ],
      ),
    );
  }
}
