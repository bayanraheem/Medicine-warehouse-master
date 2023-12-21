import 'package:flutter/material.dart';

class Vaccines extends StatefulWidget {
  const Vaccines({super.key});

  @override
  State<Vaccines> createState() => _VaccinesState();
}

class _VaccinesState extends State<Vaccines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Vaccines"),
      ),
    );
  }
}
