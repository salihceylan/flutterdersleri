import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'ui/burclar.dart';
import 'ui/bottom_navigation_kullanimi.dart';
import 'ui/page_view_kullanimi.dart';
import 'ui/stepper_kullanimi.dart';
import 'ui/form_islemleri1.dart';
import 'ui/form_islemleri2.dart';
import 'ui/form_islemleri3.dart';
import 'ui/grid_view_kullanimi1.dart';
import 'ui/alert_dialog_goster.dart';
import 'ui/navigasyon_islemleri.dart';
import 'ui/custom_scrollview_kullanimi.dart';
import 'ui/box_decoration_kullanimi.dart';
import 'ui/gesture_detector_kullanimi.dart';
import 'ui/grid_view_kullanimi3.dart';
import 'ui/grid_view_kullanimi2.dart';
import 'ui/liste_konu_anlatimi.dart';
import 'ui/liste_konu_anlatimi_2.dart';
import 'ui/picker_date_time.dart';
import 'ui/stepper_kullanimi.dart';
import 'ui/sol_menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Tüm Öğrendiklerim",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new TumDersler(),
    );
  }
}

class TumDersler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tüm Uygulamalar"),
      ),
      body: Center(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => BurcListesi(),
                  ),
                );
              },
              color: Colors.blue,
              child: Text("Burçlar"),
            ),
          ],
        ),
      )),
    );
  }
}
