import 'package:flutter/material.dart';

class SolMenu extends StatefulWidget {
  @override
  _SolMenuState createState() => _SolMenuState();
}

class _SolMenuState extends State<SolMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Account Name"),
            accountEmail: Text("salihceylan@gmail.com"),
            currentAccountPicture: CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage(
                "assets/images/crm.jpg",
              ),
            ),
            otherAccountsPictures: <Widget>[
              Icon(Icons.account_circle, size: 35),
              Icon(Icons.account_balance, size: 35),
              Icon(Icons.account_balance_wallet, size: 35),
              Icon(Icons.account_box, size: 35),
            ],
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
          InkWell(
            onTap: () {},
            splashColor: Colors.green,
            child: ListTile(
              title: Text("Ana Menu"),
              leading: Icon(
                Icons.memory,
                size: 35,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            splashColor: Colors.green,
            child: ListTile(
              title: Text("Ayarlar"),
              leading: Icon(
                Icons.portrait,
                size: 35,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            splashColor: Colors.green,
            child: ListTile(
              title: Text("Kullanıcı İşlemleri"),
              leading: Icon(
                Icons.save,
                size: 35,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            splashColor: Colors.green,
            child: ListTile(
              title: Text("Ana Menu"),
              leading: Icon(
                Icons.memory,
                size: 35,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            splashColor: Colors.green,
            child: ListTile(
              title: Text("Ayarlar"),
              leading: Icon(
                Icons.portrait,
                size: 35,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            splashColor: Colors.green,
            child: ListTile(
              title: Text("Kullanıcı İşlemleri"),
              leading: Icon(
                Icons.save,
                size: 35,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            splashColor: Colors.green,
            child: ListTile(
              title: Text("Ana Menu"),
              leading: Icon(
                Icons.memory,
                size: 35,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            splashColor: Colors.green,
            child: ListTile(
              title: Text("Ayarlar"),
              leading: Icon(
                Icons.portrait,
                size: 35,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            splashColor: Colors.green,
            child: ListTile(
              title: Text("Kullanıcı İşlemleri"),
              leading: Icon(
                Icons.save,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
