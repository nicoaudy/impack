import 'package:flutter/material.dart';
import 'package:impack/constants.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:impack/widgets/button.dart';
import 'package:impack/widgets/label.dart';

class NewActivityPage extends StatefulWidget {
  const NewActivityPage({Key? key}) : super(key: key);

  @override
  State<NewActivityPage> createState() => _NewActivityPageState();
}

class _NewActivityPageState extends State<NewActivityPage> {
  final todos = ['Meeting', 'Phone Call'];
  final objectives = ['New Order', 'Invoice', 'New Leads'];
  String? selectedTodo;
  String? selectedObjective;

  DropdownMenuItem<String> todoItem(String todo) {
    return DropdownMenuItem(
      value: todo,
      child: Text(todo),
    );
  }

  DropdownMenuItem<String> objectiveItem(String objective) {
    return DropdownMenuItem(
      value: objective,
      child: Text(objective),
    );
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
          Padding(
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
                    value: selectedTodo,
                    items: todos.map(todoItem).toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedTodo = val.toString();
                      });
                    },
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
          ),
          const SizedBox(height: 10),
          const Label(title: "Who do you want to meet/call?"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(20),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Constants.outlineColor),
                  borderRadius: BorderRadius.circular(6),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Constants.outlineColor),
                ),
                hintText: "CV Anugrah Jaya",
                suffixIcon: Icon(
                  Icons.search,
                  color: Constants.placeholderColor,
                ),
                filled: true,
                fillColor: Constants.focusColor,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Label(title: "When do you want to meet/call CV Anugrah Jaya"),
          Padding(
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
              initialValue: DateTime.now().toString(),
              firstDate: DateTime(DateTime.now().year),
              lastDate: DateTime(DateTime.now().year + 5),
              onChanged: (val) => print(val),
              validator: (val) {
                print(val);
                return null;
              },
              onSaved: (val) => print(val),
            ),
          ),
          const SizedBox(height: 10),
          const Label(title: "Why do you want to meet/call CV Anugrah Jaya?"),
          Padding(
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
                    value: selectedObjective,
                    items: objectives.map(objectiveItem).toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedObjective = val.toString();
                      });
                    },
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
          ),
          const SizedBox(height: 10),
          const Label(title: "Could you describe it more details?"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              maxLines: 4,
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
          ),
          Button(onTap: () {}, title: "Submit"),
        ],
      ),
    );
  }
}
