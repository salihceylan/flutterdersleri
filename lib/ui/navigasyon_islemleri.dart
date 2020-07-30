import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class NavigasyonIslemleri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Navigasyon İşlemleri",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                "A Sayfasına Git",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              color: Colors.purple,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ASayfasi("BEN A SAYFASIYIM"),
                  ),
                ).then((value) {
                  value
                      ? Fluttertoast.showToast(
                          msg: "VERİ SİLİNDİ DOSTUM",
                          toastLength: Toast.LENGTH_SHORT)
                      : Fluttertoast.showToast(
                          msg: "VERİ SİLİNmedi DOSTUM",
                          toastLength: Toast.LENGTH_SHORT);
                });
              },
            ),
            RaisedButton(
              child: Text(
                "B Sayfasına Git",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              color: Colors.purple,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BSayfasi(),
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text(
                "C Sayfasına Git",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              color: Colors.purple,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CSayfasi(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ASayfasi extends StatelessWidget {
  final String _gelenBilgi;

  ASayfasi(this._gelenBilgi);

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Navigasyon İşlemleri",
          style: TextStyle(
            color: Colors.white,
            fontSize: 45,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _gelenBilgi,
              style: TextStyle(
                color: Colors.red,
                fontSize: 45,
              ),
            ),
            RaisedButton(
              child: Text(
                "B Sayfasına Git",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              color: Colors.purple,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BSayfasi(),
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text(
                "C Sayfasına Git",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              color: Colors.purple,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CSayfasi(),
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text(
                "GERİ DÖN",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              color: Colors.purple,
              onPressed: () {
                Navigator.pop(context, false);
                Fluttertoast.showToast(
                    msg: "Veri Silindi", toastLength: Toast.LENGTH_SHORT);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Navigasyon İşlemleri",
          style: TextStyle(
            color: Colors.white,
            fontSize: 45,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Ben B Sayfasıyım...",
              style: TextStyle(
                color: Colors.red,
                fontSize: 45,
              ),
            ),
            RaisedButton(
              child: Text(
                "A Sayfasına Git",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              color: Colors.purple,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ASayfasi("BEN A SAYFASIYIM"),
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text(
                "C Sayfasına Git",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              color: Colors.purple,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CSayfasi(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Navigasyon İşlemleri",
          style: TextStyle(
            color: Colors.white,
            fontSize: 45,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Ben C Sayfasıyım...",
              style: TextStyle(
                color: Colors.red,
                fontSize: 45,
              ),
            ),
            RaisedButton(
              child: Text(
                "A Sayfasına Git",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              color: Colors.purple,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ASayfasi("BEN A SAYFASIYIM"),
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text(
                "B Sayfasına Git",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              color: Colors.purple,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BSayfasi(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
