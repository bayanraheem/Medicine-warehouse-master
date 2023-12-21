import 'package:flutter/material.dart';

class Sterilizers extends StatefulWidget {
  const Sterilizers({super.key});

  @override
  State<Sterilizers> createState() => _SterilizersState();
}

class _SterilizersState extends State<Sterilizers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Sterilizers"),
      ),
    );
  }
}
