import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'sol_menu.dart';

import 'package:fluttertoast/fluttertoast.dart';

class BottomNavigationKullanimi extends StatefulWidget {
  @override
  _BottomNavigationKullanimiState createState() =>
      _BottomNavigationKullanimiState();
}

class _BottomNavigationKullanimiState extends State<BottomNavigationKullanimi> {
  int _secilenMenuItem = 0;
  List<Widget> sayfalar;
  var anaSayfa, aramaSayfasi, ekleSayfasi;
  var keyAra = PageStorageKey("keyAra");

  @override
  void initState() {
    super.initState();
    sayfalar = [];
    aramaSayfasi = Ara(keyAra);
    anaSayfa = AnaSayfa();
    ekleSayfasi = Ekle();

    sayfalar.add(anaSayfa);
    sayfalar.add(aramaSayfasi);
    sayfalar.add(ekleSayfasi);
    sayfalar.add(ekleSayfasi);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: alttaGorunenBar(),
      drawer: SolMenu(),
      appBar: AppBar(
        title: Text("My Lessons"),
      ),
      body: ortaAlan(),
    );
  }

  alttaGorunenBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      currentIndex: _secilenMenuItem,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            activeIcon: Icon(Icons.poll),
            title: Text("Ana Sayfa"),
            backgroundColor: Colors.redAccent),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            activeIcon: Icon(
              Icons.table_chart,
            ),
            title: Text("Ara"),
            backgroundColor: Colors.blueAccent),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
            ),
            activeIcon: Icon(
              Icons.wifi_tethering,
            ),
            title: Text("Ekle"),
            backgroundColor: Colors.orangeAccent),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
            ),
            activeIcon: Icon(
              Icons.wifi,
            ),
            title: Text("Resim Ekle"),
            backgroundColor: Colors.greenAccent),
      ],
      onTap: (itemIndex) {
        setState(() {
          _secilenMenuItem = itemIndex;
        });
      },
    );
  }

  Widget ortaAlan() {
    return sayfalar[_secilenMenuItem];
  }
}

class AnaSayfa extends StatefulWidget {

  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      key:PageStorageKey("exp1"),
      children: <Widget>[
        ExpansionTile(
     
          title: Text("ExpansionTile1"),
          children: <Widget>[
            Container(
              height: 200,
              child: Card(
                color: Colors.blue.shade300,
                elevation: 7,
                margin: EdgeInsets.all(9),
                shadowColor: Colors.black26,
                child: ListView(
                  padding: EdgeInsets.all(5),
                  children: <Widget>[
                    InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      onTap: () {},
                      hoverColor: Colors.white,
                      child: ListTile(
                        key: PageStorageKey("lst1"),
                        leading: Text("1. Üye"),
                      ),
                    ),
                    SizedBox(
                      child: Container(
                        height: 3,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      onTap: () {},
                      hoverColor: Colors.white,
                      child: ListTile(key: PageStorageKey("lst2"),
                        leading: Text("2. Üye"),
                      ),
                    ),
                    SizedBox(
                      child: Container(
                        height: 3,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      onTap: () {},
                      hoverColor: Colors.white,
                      child: ListTile(
                        key: PageStorageKey("lst3"),
                        leading: Text("3. Üye"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Ara extends StatefulWidget {
  Ara(Key keyAra) : super(key: keyAra);

  _AraState createState() => _AraState();
}

class _AraState extends State<Ara> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(7),
      itemBuilder: (context, index) {
        PageStorageKey("$index");
        return Container(
          margin: EdgeInsets.all(7),
          child: Material(
            elevation: 15,
            color: index % 2 == 0 ? Colors.green[200] : Colors.green[500],
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: Center(
                child: Text(
              "Ara $index",
              style: TextStyle(fontSize: 35, color: Colors.white),
            )),
          ),
        );
      },
      itemExtent: 150,
    );
  }
}

class Ekle extends StatefulWidget {
  @override
  _EkleState createState() => _EkleState();
}

class _EkleState extends State<Ekle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Center(
          child: Text(
        "Ekle",
        style: TextStyle(fontSize: 35, color: Colors.white),
      )),
    );
  }
}

class ResimEkle extends StatefulWidget {
  @override
  _ResimEkleState createState() => _ResimEkleState();
}

class _ResimEkleState extends State<ResimEkle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Center(
          child: Text(
        "Resim Ekle",
        style: TextStyle(fontSize: 35, color: Colors.white),
      )),
    );
  }
}
