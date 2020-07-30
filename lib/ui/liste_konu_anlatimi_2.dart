import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';




class ListeKonuAnlatimi2 extends StatelessWidget {
  List<Ogrenciler> ogrenciler = [];

  @override
  Widget build(BuildContext context) {
    ogrencileriGetir();

    return ListView.builder(
        itemCount: ogrenciler.length,
        itemBuilder: (context, index) => Card(
              child: ListTile(
                leading: Icon(Icons.accessibility),
                title: Text(ogrenciler[index]._isim),
                subtitle: Text(ogrenciler[index]._aciklama),
                trailing:
                    ogrenciler[index]._cinsiyet ? Text("Man") : Text("Women"),
                onTap: () => Fluttertoast.showToast(
                  msg: ogrenciler[index]._isim + " Tıklandı.",
                  fontSize: 35,
                  gravity: ToastGravity.TOP,
                  toastLength: Toast.LENGTH_SHORT,
                  backgroundColor : Colors.green,
                ),
                onLongPress: () => Fluttertoast.showToast(
                  msg: ogrenciler[index]._isim + " uzun  Tıklandı.",
                  fontSize: 35,
                  gravity: ToastGravity.TOP,
                  toastLength: Toast.LENGTH_SHORT,
                  backgroundColor: Colors.green,
                ),
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
}

class Ogrenciler {
  String _isim;
  String _aciklama;
  bool _cinsiyet;

  Ogrenciler(this._isim, this._aciklama, this._cinsiyet);
}
