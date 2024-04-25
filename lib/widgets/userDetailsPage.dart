import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DetailsPage();
}

class _DetailsPage extends State<UserDetailsPage> {
  List<dynamic> address = [];
  late String mobileNo;

  @override
  void initState() {
    super.initState();
    // readJson();
    loadMobileNo();
  }

  Future<void> readJson() async {
    try {
      final String response =
      await rootBundle.loadString('jsonFile/details.json');
      final data = json.decode(response);
      print("JSON Data: $data"); // Print the entire JSON data for debugging

      setState(() {
        // Accessing the "address" field from JSON data
        address = data["user"] ?? []; // Using null-aware operator to handle null case
      });
    } catch (e) {
      print("Error loading JSON: $e");
    }
  }

  Future<void> loadMobileNo() async {
    String jsonString = await rootBundle.loadString('jsonFile/details.json');
    final data = json.decode(jsonString);
     setState(() {
       mobileNo = data["mobile"];
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text("User Details"),
      ),
      body: Center(
        child: Text(mobileNo ?? 'loading'),
      ),
    );
  }
}