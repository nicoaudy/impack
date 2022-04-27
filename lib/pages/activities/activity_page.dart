import 'package:flutter/material.dart';
import 'package:impack/constants.dart';
import 'package:impack/widgets/app_header.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          AppHeader(),
          ListTile(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: Constants.primaryColor,
      ),
    );
  }
}
