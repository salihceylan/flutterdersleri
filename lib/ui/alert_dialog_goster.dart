import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';




class AlertDialogGoster extends StatelessWidget {
  List<Ogrenciler> ogrenciler = [];

  @override
  Widget build(BuildContext context) {
    ogrencileriGetir();

    return ListView.builder(
        itemCount: ogrenciler.length,
        itemBuilder: (context, index) => Card(
              child: ListTile(
                leading: Icon(Icons.accessibility),
                title: Text(ogrenciler[index].toString()),
                subtitle: Text(ogrenciler[index].toString()),
                trailing:
                    ogrenciler[index]._cinsiyet ? Text("Man") : Text("Women"),
                onTap: () {
                  tostYazdir(ogrenciler[index]._isim, "Just One Tık");
                  alertDiyalogGoster(
                      context, "Tek Tıkladı", ogrenciler[index]._isim);
                },
                onLongPress: () {
                  tostYazdir(ogrenciler[index]._isim, "Long Press");
                  alertDiyalogGoster(
                      context, "Uzun Tıkladı", ogrenciler[index]._isim);
                },
              ),
              elevation: 5.0,
              color: Colors.cyanAccent,
              margin: EdgeInsets.all(5),
            ));
  }

  void ogrencileriGetir() {
    ogrenciler = List.generate(
        20,
        (index) => Ogrenciler("Öğrenci $index", "Açıklama $index",
            index % 2 == 0 ? true : false));
  }

  void tostYazdir(String isim, String olay) {
    Fluttertoast.showToast(
      msg: isim + olay,
      fontSize: 35,
      gravity: ToastGravity.TOP,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.green,
    );
  }

  alertDiyalogGoster(BuildContext ctx, String olay, String isim) {
    showDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          title: Container(
            padding: EdgeInsets.all(5),
            color: Colors.red,
            alignment: Alignment.center,
            child: ListBody(
              children: <Widget>[
                Text(
                  "Başlık",
                  textAlign: TextAlign.center,
                ),
                Icon(Icons.adb)
              ],
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "Sn. $isim Lütfen $olay durumuna Karar verin. Ne yapacağız dostum?\nSn. $isim Lütfen $olay durumuna Karar verin. Ne yapacağız dostum?\nSn. $isim Lütfen $olay durumuna Karar verin. Ne yapacağız dostum?\nSn. $isim Lütfen $olay durumuna Karar verin. Ne yapacağız dostum?\nSn. $isim Lütfen $olay durumuna Karar verin. Ne yapacağız dostum?\nSn. $isim Lütfen $olay durumuna Karar verin. Ne yapacağız dostum?\nSn. $isim Lütfen $olay durumuna Karar verin. Ne yapacağız dostum?\nSn. $isim Lütfen $olay durumuna Karar verin. Ne yapacağız dostum?\nSn. $isim Lütfen $olay durumuna Karar verin. Ne yapacağız dostum?\nSn. $isim Lütfen $olay durumuna Karar verin. Ne yapacağız dostum?\nSn. $isim Lütfen $olay durumuna Karar verin. Ne yapacağız dostum?\nSn. $isim Lütfen $olay durumuna Karar verin. Ne yapacağız dostum?\nSn. $isim Lütfen $olay durumuna Karar verin. Ne yapacağız dostum?\nSn. $isim Lütfen $olay durumuna Karar verin. Ne yapacağız dostum?\nSn. $isim Lütfen $olay durumuna Karar verin. Ne yapacağız dostum?\nSn. $isim Lütfen $olay durumuna Karar verin. Ne yapacağız dostum?\nSn. $isim Lütfen $olay durumuna Karar verin. Ne yapacağız dostum?\nSn. $isim Lütfen $olay durumuna Karar verin. Ne yapacağız dostum?\nSn. $isim Lütfen $olay durumuna Karar verin. Ne yapacağız dostum?\n",
                  style: TextStyle(
                    color: Colors.red,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Icon(Icons.title),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Tamam",
              ),
              onPressed: () {},
            ),
            RaisedButton(
              color: Colors.red,
              child: Text(
                "Kapat",
              ),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class Ogrenciler {
  String _isim;
  String _aciklama;
  bool _cinsiyet;

  Ogrenciler(this._isim, this._aciklama, this._cinsiyet);

  @override
  String toString() {
    // TODO: implement toString
    return _isim + " " + _aciklama + " " + (_cinsiyet ? "Erkek" : "Kız ");
  }
}
