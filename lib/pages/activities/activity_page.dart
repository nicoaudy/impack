import 'package:flutter/material.dart';
import 'package:impack/constants.dart';
import 'package:impack/pages/activities/detail_activity_page.dart';
import 'package:impack/pages/activities/new_activity_page.dart';
import 'package:impack/widgets/app_header.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Constants.primaryColor,
        currentIndex: 0,
        onTap: (val) {},
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Activity",
            icon: Icon(Icons.calendar_month),
          ),
          BottomNavigationBarItem(
            label: "Orders",
            icon: Icon(Icons.file_copy_outlined),
          ),
          BottomNavigationBarItem(
            label: "My Profile",
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
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
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailActivityPage(),
                  ),
                );
              },
              child: const ListTile(
                leading: Text('09:00'),
                title: Text('Thursday, 01 April 2022'),
                subtitle: Text('Meeting with CV Anugrah Jaya'),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewActivityPage()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Constants.primaryColor,
      ),
    );
  }
}
