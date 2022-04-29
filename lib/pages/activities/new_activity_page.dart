import 'package:flutter/material.dart';
import 'package:impack/constants.dart';
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
  String? intitution;
  String objective = 'New Order';
  String when = DateTime.now().toString();
  String? remarks;

  void _showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red[200],
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

  submit() {
    setState(() {
      loading = true;
    });

    if (activityType.isEmpty ||
        intitution == null ||
        objective.isEmpty ||
        when.isEmpty ||
        remarks == null) {
      // Simple toast validation
      // only client side validation for now
      _showToast(
        context,
        "Whops👻! \nPlease check your input! We need backend validation also😂",
      );
      setState(() {
        loading = false;
      });
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
                intitution = val;
              });
            },
            hintText: "CV Anugrah Jaya",
          ),
          const SizedBox(height: 10),
          const Label(title: "When do you want to meet/call CV Anugrah Jaya"),
          DatetimePicker(
            initialValue: when,
            onSaved: (val) {
              setState(() {
                when = val;
              });
            },
          ),
          const SizedBox(height: 10),
          const Label(title: "Why do you want to meet/call CV Anugrah Jaya?"),
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
