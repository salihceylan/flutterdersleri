import 'package:flutter/material.dart';
import 'sol_menu.dart';

class TabbarTabviewKullanimi extends StatefulWidget {
  @override
  _TabbarTabviewKullanimiState createState() => _TabbarTabviewKullanimiState();
}

class _TabbarTabviewKullanimiState extends State<TabbarTabviewKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SolMenu(),
      appBar: AppBar(
        title: Text("Tabbar TabView Kullanımı"),
      ),
      body: Container(),
    );
  }
}
