import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as matematik;


import 'package:fluttertoast/fluttertoast.dart';


class CustomScrollViewKullanimi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.orangeAccent,
          leading: Icon(
            Icons.keyboard_backspace,
            color: Colors.purple,
            size: 35,
          ),
          actions: <Widget>[
            Icon(
              Icons.print,
              color: Colors.blue,
              size: 35,
            ),
            Icon(
              Icons.print,
              color: Colors.red,
              size: 35,
            ),
            Icon(
              Icons.print,
              color: Colors.green,
              size: 35,
            ),
          ],
          pinned: true,
          floating: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "Başlık...",
              style: TextStyle(color: Colors.pink),
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
            background: Image.asset(
              "assets/images/crm.jpg",
              fit: BoxFit.contain,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            _listeElemanlari(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(15),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              _listeElemanlariDinamik,
              childCount: 6,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(15),
          sliver: SliverFixedExtentList(
            delegate: SliverChildListDelegate(
              _listeElemanlari(),
            ),
            itemExtent: 250,
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(15),
          sliver: SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              _listeElemanlariDinamik,
              childCount: 20,
            ),
            itemExtent: 50,
          ),
        ),
        SliverGrid(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          delegate: SliverChildListDelegate(
            _listeElemanlari(),
          ),
        ),
        SliverGrid(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          delegate: SliverChildBuilderDelegate(
            _listeElemanlariDinamik,
            childCount: 25,
          ),
        ),
        SliverGrid(
          gridDelegate:
              SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150),
          delegate: SliverChildBuilderDelegate(_listeElemanlariDinamik,
              childCount: 15),
        ),
        SliverGrid.count(
          //bu şekilde de kullanılabilir

          crossAxisCount: 7,
          children: _listeElemanlari(),
        ),
        SliverGrid.extent(
          //bu şekilde de kullanılabilir
          maxCrossAxisExtent: 150,
          children: _listeElemanlari(),
        ),
      ],
    );
  }
}

List<Widget> _listeElemanlari() {
  return [
    Container(

      margin: EdgeInsets.all(5),
      color: Colors.blue,
      alignment: Alignment.center,
      height: 100,
      child: Text(
        "Merhaba Flutter",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 23, color: Colors.white),
      ),
    ),
    Container(
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      color: Colors.green,
      height: 100,
      child: Text(
        "Merhaba Flutter",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 23, color: Colors.white),
      ),
    ),
    Container(
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      color: Colors.yellow,
      height: 100,
      child: Text(
        "Merhaba Flutter",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 23, color: Colors.white),
      ),
    ),
    Container(
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      color: Colors.pink,
      height: 100,
      child: Text(
        "Merhaba Flutter",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 23, color: Colors.white),
      ),
    ),
    Container(
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      color: Colors.purple,
      height: 100,
      child: Text(
        "Merhaba Flutter",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 23, color: Colors.white),
      ),
    ),
    Container(
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      color: Colors.red,
      height: 100,
      child: Text(
        "Merhaba Flutter",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 23, color: Colors.white),
      ),
    ),
  ];
}

Widget _listeElemanlariDinamik(BuildContext context, int index) {
  return GestureDetector(
    onTap: () => Fluttertoast.showToast(msg: "${index + 1} tıklandı."),
    onLongPress: () => Fluttertoast.showToast(msg: "${index + 1} Long Press."),
    child: Container(
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          new Radius.circular(10),
        ),
        gradient: LinearGradient(
          colors: [rasgeleRenkUret(), rasgeleRenkUret()],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          new BoxShadow(
            color: Colors.red,
            offset: new Offset(2, 1),
          ),
        ],
      ),
      height: 100,
      child: Text(
        "Merhaba Flutter Dinamik Eleman ${index + 1}",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 23, color: Colors.white),
      ),
    ),
  );
}

Color rasgeleRenkUret() {
  return Color.fromARGB(
    matematik.Random().nextInt(255),
    matematik.Random().nextInt(255),
    matematik.Random().nextInt(255),
    matematik.Random().nextInt(255),
  );
}
