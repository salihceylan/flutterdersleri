import 'package:flutter/material.dart';


class ListeKonuAnlatimi extends StatelessWidget {
  List<int> listeIndexlerim = List.generate(300, (index) => index);
  List<String> listeAltBasliklerim =
      List.generate(300, (index) => "Liste Elemanım $index");

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listeIndexlerim
          .map((eleman) => Column(
                children: <Widget>[
                  Container(
                    child: Card(
                      margin: EdgeInsets.all(1),
                      color: Colors.cyan.shade200,
                      elevation: 20,
                      shadowColor: Colors.black26,
                      child: ListTile(
                        title: Text(eleman.toString()),
                        subtitle: Text(listeAltBasliklerim[eleman]),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.android,
                            size: 30,
                          ),
                          radius: 19,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.cyan,
                    thickness: 3,
                    indent: 5,
                    endIndent: 5,
                  ),
                ],
              ))
          .toList(),
    );
  }
}
