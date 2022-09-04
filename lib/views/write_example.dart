import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class WriteExamples extends StatefulWidget {
  const WriteExamples({super.key});

  @override
  State<WriteExamples> createState() => _WriteExamplesState();
}

class _WriteExamplesState extends State<WriteExamples> {
  final database = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    final dailySpecialRef = database.child('dailySpecial/');
    return Scaffold(
      appBar: AppBar(
        title: Text("write examples"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await dailySpecialRef.set({
                      'decription': 'vanilla latte',
                      'price': 4.99,
                    }).then((value) {
                      print("special of the day has been written");
                    }).catchError((error) {
                      print("you got an $error!");
                    });
                  },
                  child: const Text("simple Set"))
            ],
          ),
        ),
      ),
    );
  }
}
