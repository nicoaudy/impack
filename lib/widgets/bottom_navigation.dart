import 'package:flutter/material.dart';
import 'package:impack/constants.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
