import 'package:flutter/material.dart';
import 'package:impack/constants.dart';
import 'package:impack/networking.dart';
import 'package:impack/widgets/button.dart';
import 'package:impack/widgets/text_area.dart';

class DetailActivityPage extends StatefulWidget {
  final String id;
  const DetailActivityPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailActivityPage> createState() => _DetailActivityPageState();
}

class _DetailActivityPageState extends State<DetailActivityPage> {
  Map activity = {};

  @override
  void initState() {
    super.initState();
    _fetchActivity();
  }

  _fetchActivity() async {
    final response = await Networking().getActivity(widget.id);
    setState(() {
      activity = response['data'];
    });
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
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Constants.placeholderColor),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Details",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(activity['remarks'] ?? ''),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Constants.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "Edit Activity",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "What is the result?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextArea(onChanged: () {}),
          Button(onTap: () {}, title: "Complete Activity", loading: false),
        ],
      ),
    );
  }
}
