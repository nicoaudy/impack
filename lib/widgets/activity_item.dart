import 'package:flutter/material.dart';

class ActivityItem extends StatelessWidget {
  final Function onTap;
  final String date;
  final String time;
  final String title;
  final String subtitle;

  const ActivityItem({
    Key? key,
    required this.onTap,
    required this.date,
    required this.time,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              style: BorderStyle.solid,
              color: Colors.grey,
            ),
          ),
        ),
        child: ListTile(
          leading: Column(
            children: [
              const SizedBox(height: 10),
              Text(date),
              Text(time),
            ],
          ),
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
