import 'package:flutter/material.dart';


class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

  int _aktifStep = 0;
  String kullaniciAdi, mail, sifre;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Text(
              "Stepper Widget.",
            )),
        body: SingleChildScrollView(
          child: Stepper(
              steps: _tumStepler(),
              currentStep: _aktifStep,
              onStepTapped: (tiklananStep) {
                setState(() {
                  _aktifStep = tiklananStep;
                });
              },
              onStepContinue: () {
                setState(() {
                  if (_formKey1.currentState.validate()) {

                    _formKey1.currentState.save();
                    if (_aktifStep < _tumStepler().length - 1) {
                      _aktifStep++;
                    }
                  }
                });
              },
              onStepCancel: () {
                setState(() {
                  if (_aktifStep > 0) {
                    _aktifStep--;
                  }
                });
              }),
        ),
      ),
    );
  }

  List<Step> _tumStepler() {
    List<Step> stepler = [
      Step(
        title: Text("Kullanıcı Adı Başlık Girişi"),
        subtitle: Text("Kullanıcı Adı AltBaşlık"),
        state: StepState.indexed,
        isActive: true,
        content: Form(
          autovalidate: true,
          key: _formKey1,
          child: TextFormField(
            validator: (girilenVeri) {
              if (girilenVeri.isEmpty) {
                return "Kullanıcı Adınızı Giriniz...";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: "Kullanıcı Adı",
              hintText: "Kullanıcı Hint",
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
      Step(
        title: Text("e-mail"),
        subtitle: Text("e-mail Alt Başlık"),
        state: StepState.indexed,
        isActive: true,
        content: Form(
          autovalidate: true,
          key: _formKey2,
          child: TextFormField(
            validator: (girilenVeri) {
              if (girilenVeri.isEmpty) {
                return "e-Mail adresinizi doğru giriniz...";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: "e-Mail adresi",
              hintText: "e-Mail adresi Hint",
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
      Step(
        title: Text("Şifre  Girişi"),
        subtitle: Text("Şifre AltBaşlık"),
        state: StepState.indexed,
        isActive: true,
        content: Form(
          autovalidate: true,
          key: _formKey3,
          child: TextFormField(
            validator: (girilenVeri) {
              if (girilenVeri.isEmpty) {
                return "Şifrenizi Giriniz...";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: "Şifre",
              hintText: "Şifre Hint",
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    ];

    return stepler;
  }
}
