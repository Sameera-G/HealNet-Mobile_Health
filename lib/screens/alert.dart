import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:healnet/screens/dashpage.dart';

class Alert extends StatefulWidget {
  const Alert({super.key});

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  DatabaseReference statusvars2 = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert status - on"),
      ),
      body: Center(
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/drone1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: MaterialButton(
              onPressed: () {
                Map<String, int> students = {
                  'pump_status': 0,
                };
                statusvars2.child('StatusVars').update(students).then((value) =>
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashPage())));
              },
              color: Colors.blue,
              textColor: Colors.white,
              minWidth: 300,
              height: 40,
              child: const Text('Cancel Alert'),
            ),
          ),
        ),
      ),
    );
  }
}
