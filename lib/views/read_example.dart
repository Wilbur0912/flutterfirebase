import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ReadExamples extends StatefulWidget {
  const ReadExamples({super.key});

  @override
  State<ReadExamples> createState() => _ReadExamplesState();
}

class _ReadExamplesState extends State<ReadExamples> {
  String _displayText = 'Result go here';
  final _database = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    _activateListeners();
  }

  void _activateListeners() {
    //_database.child("dailySpecial").child("description");
    _database.child("dailySpecial/description").onValue.listen((event) {
      final String description = event.snapshot.value.toString();
      setState(() {
        _displayText = 'Today\'s special: $description';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read examples"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
