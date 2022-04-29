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
import 'package:intl/intl.dart';

class EditActivityPage extends StatefulWidget {
  final String id;
  const EditActivityPage({Key? key, required this.id}) : super(key: key);

  @override
  State<EditActivityPage> createState() => _EditActivityPageState();
}

class _EditActivityPageState extends State<EditActivityPage> {
  final todos = ['Meeting', 'Phone Call'];
  final objectives = ['New Order', 'Invoice', 'New Leads'];

  bool loading = true;
  late String activityType;
  late String objective;
  late String when;
  late TextEditingController institution = TextEditingController();
  late TextEditingController remarks = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchActivity();
  }

  _fetchActivity() async {
    final response = await Networking().getActivity(widget.id);
    setState(() {
      activityType = response['data']['activityType'];
      objective = response['data']['objective'];
      institution.text = response['data']['institution'];
      when = DateFormat('dd-MMMM-yyyy HH:mm').format(DateTime.parse(
        response['data']['when'],
      ));
      remarks.text = response['data']['remarks'];
      loading = false;
    });
  }

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
        objective.isEmpty ||
        when.isEmpty ||
        institution.text.isEmpty ||
        remarks.text.isEmpty) {
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

    final response = await Networking().editActivity(
      widget.id.toString(),
      activityType,
      institution.text,
      when,
      objective,
      remarks.text,
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
          "Edit Activity",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
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
                  onChanged: (val) => setState(() {}),
                  controller: institution,
                  hintText: "CV Anugrah Jaya",
                ),
                const SizedBox(height: 10),
                Label(
                  title: "When do you want to meet/call ${institution.text}?",
                ),
                DatetimePicker(
                  initialValue: when,
                  onSaved: (val) {
                    setState(() {
                      when = val;
                    });
                  },
                ),
                const SizedBox(height: 10),
                Label(
                  title: "Why do you want to meet/call ${institution.text}?",
                ),
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
                TextArea(
                  onChanged: (val) => setState(() {}),
                  controller: remarks,
                ),
                Button(
                  onTap: () => submit(),
                  title: "Submit",
                  loading: loading,
                ),
              ],
            ),
    );
  }
}
