import 'package:flutter/material.dart';

class ForgetScreen extends StatelessWidget {
  // const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text("Display page")),
      body: Center(
        child: Text('Welcome to Display Page!'),
      ),
    );
  }
}
