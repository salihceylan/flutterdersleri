import 'package:flutter/material.dart';

class FormIslemleri2 extends StatefulWidget {
  @override
  _FormIslemleri2State createState() => _FormIslemleri2State();

  @override
  setState() {}
}

class _FormIslemleri2State extends State<FormIslemleri2> {
  final formKey = GlobalKey<FormState>();
  String _kullaniciAdi, _sifre, _email;

  bool showPass = true;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        accentColor: Colors.purple,
        primaryColor: Colors.orange,
      ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          mini: true,
          child: Icon(Icons.scatter_plot),
          onPressed: () {},
        ),
        appBar: AppBar(title: Text("TextFormField")),
        body: Center(
          child: Container(
              child: Form(
            key: formKey,
            autovalidate: true,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    validator: _kullaniciAdiKontrolEt,
                    decoration: InputDecoration(
                      helperText: "Girmek Zorunlu",
                      labelText: "Kullanıcı Adı: ",
                      prefixIcon: Icon(Icons.account_circle),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.blueAccent)),
                    ),
                    onSaved: (value) => _kullaniciAdi = value,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: _emailKontrolEt,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: "E-Mail",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    onSaved: (value) => _email = value,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 35,
                    ),
                    obscureText: showPass,
                    validator: _sifreKontrolEt,
                    decoration: InputDecoration(
                      suffix: IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: showPass ? Colors.green : Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            showPass ? showPass = false : showPass = true;
                          });
                        },
                      ),
                      prefixIcon: Icon(Icons.security),
                      labelText: "Şifre",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    onSaved: (value) => _sifre = value,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RaisedButton.icon(
                    onPressed: () {
                      _kaydet();
                    },
                    icon: Icon(Icons.save),
                    label: Text("KAYDET"),
                    disabledColor: Colors.red,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }

  String _sifreKontrolEt(String value) {
    if (value.length < 5) {
      return "Şifreniz  5 harften küçük olamaz";
    } else {
      return null;
    }
  }

  String _emailKontrolEt(String value) {
    if (value.length < 5) {
      return "e Mail adresi  5 harften küçük olamaz";
    } else {
      return null;
    }
  }

  String _kullaniciAdiKontrolEt(String value) {
    if (value.length < 5) {
      return "Kullanıcı Adı  5 harften küçük olamaz";
    } else {
      return null;
    }
  }

  void _kaydet(){
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      setState(() {
        debugPrint(
            "Kullanıcı Adı: $_kullaniciAdi  Şifre: $_sifre email : $_email");
      });
    } else
      return null;
  }
}
