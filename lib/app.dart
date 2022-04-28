import 'package:flutter/material.dart';
import 'package:impack/constants.dart';
import 'package:impack/pages/activities/activity_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme:
            TextSelectionThemeData(cursorColor: Constants.primaryColor),
      ),
      home: const ActivityPage(),
    );
  }
}
