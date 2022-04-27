import 'package:flutter/material.dart';
import 'package:impack/widgets/header_with_button.dart';

class NewActivityPage extends StatelessWidget {
  const NewActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: const [
        HeaderWithButton(),
      ]),
    );
  }
}
