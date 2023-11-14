import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class AdminTab extends StatefulWidget {
  const AdminTab({super.key});

  @override
  State<AdminTab> createState() => _AdminTabState();
}

class _AdminTabState extends State<AdminTab> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          FutureBuilder(
              future: db.collection("users").doc("gYikLsuzorQwAoZCKcLo").get(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data!.data();
                  var value = data!['born'];
                  // return text with value transforming it to a string
                  return Text(value.toString());
                }
                return const Text('User');
              }),
          ButtonBar(
            children: [
              TextButton(
                  onPressed: incrementCounter, child: const Text("Increment")),
              TextButton(onPressed: reduceCounter, child: const Text("Reduce"))
            ],
          )
        ],
      ),
    );
  }

  void incrementCounter() {
    logger.i("Admin Increment Counter");
    final user = <String, dynamic>{
      "first": "Alan",
      "middle": "Mathison",
      "last": "Turing",
      "born": 1912
    };

// Add a new document with a generated ID
    db
        .collection("users")
        .doc("gYikLsuzorQwAoZCKcLo")
        .update({"born": FieldValue.increment(1)}).then(
            (value) => logger.i("incremented counter"));
  }

  void reduceCounter() {
    db
        .collection("users")
        .doc("gYikLsuzorQwAoZCKcLo")
        .update({"born": FieldValue.increment(-1)}).then(
            (value) => logger.i("reduced counter"));
  }
}
