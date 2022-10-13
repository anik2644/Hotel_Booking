import 'package:flutter/material.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar:  AppBar(
        title: const Text("LogoutPage"),
      ),
      body: const Center(
        child: Text("LogoutPage"),
      ),
    );
  }
}
