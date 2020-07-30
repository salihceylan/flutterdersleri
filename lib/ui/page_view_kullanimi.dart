import 'package:flutter/material.dart';
import 'sol_menu.dart';

class PageViewKullanimi extends StatefulWidget {
  @override
  _PageViewKullanimiState createState() => _PageViewKullanimiState();
}

class _PageViewKullanimiState extends State<PageViewKullanimi> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SolMenu(),
      appBar: AppBar(
        title: Text("My Lessons"),
      ),
      body: Container(child: Center(child: Text("Tmm ")),)
    );
  }
}
