import 'package:flutter/material.dart';
import 'sol_menu.dart';

class StepperKullanimi extends StatefulWidget {
  @override
  _StepperKullanimiState createState() => _StepperKullanimiState();
}

class _StepperKullanimiState extends State<StepperKullanimi> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SolMenu(),
      appBar: AppBar(
        title: Text("My Lessons"),
      ),
      body: SingleChildScrollView(
      ),
    );
  }
}
