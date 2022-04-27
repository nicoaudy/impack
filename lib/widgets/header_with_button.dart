import 'package:flutter/material.dart';
import 'package:impack/constants.dart';

class HeaderWithButton extends StatelessWidget {
  const HeaderWithButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      color: Constants.primaryColor,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: Text('Text'),
              ),
            ],
          ),
          const Center(
            child: Text(
              'Activities',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
