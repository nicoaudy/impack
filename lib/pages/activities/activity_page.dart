import 'package:flutter/material.dart';
import 'package:impack/constants.dart';
import 'package:impack/widgets/app_header.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppHeader(),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                  color: Colors.grey,
                ),
              ),
            ),
            child: const ListTile(
              leading: Text('09:00'),
              title: Text('Thursday, 01 April 2022'),
              subtitle: Text('Meeting with CV Anugrah Jaya'),
            ),
          ),
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
