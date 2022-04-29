import 'package:flutter/material.dart';
import 'package:impack/constants.dart';
import 'package:impack/networking.dart';
import 'package:impack/pages/activities/detail_activity_page.dart';
import 'package:impack/pages/activities/new_activity_page.dart';
import 'package:impack/widgets/activity_item.dart';
import 'package:impack/widgets/app_header.dart';
import 'package:impack/widgets/bottom_navigation.dart';
import 'package:intl/intl.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  late Future<List> activities;

  @override
  void initState() {
    super.initState();
    activities = Networking().getActivities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      body: Column(
        children: [
          const AppHeader(),
          Expanded(
            child: FutureBuilder<List>(
              future: activities,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List? data = snapshot.data;
                  return ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final activity = data[index];
                      final when = DateTime.parse(activity['when']);
                      final date = DateFormat('dd-MMMM-yyyy').format(when);
                      final time = DateFormat('HH:mm').format(when);

                      return ActivityItem(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailActivityPage(
                              id: activity['id'].toString(),
                            ),
                          ),
                        ),
                        date: date,
                        time: time,
                        title:
                            "${activity['activityType']} with ${activity['institution']}",
                        subtitle: activity['remarks'],
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const Center(child: CircularProgressIndicator());
              },
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
