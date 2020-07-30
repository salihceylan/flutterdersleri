import 'package:flutter/material.dart';
import 'sol_menu.dart';

class StepperKullanimi extends StatefulWidget {
  @override
  _StepperKullanimiState createState() => _StepperKullanimiState();
}

class _StepperKullanimiState extends State<StepperKullanimi> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

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
            onSaved: (gelenDeger) => print("Kullanıcı Adi: $gelenDeger"),
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
            onSaved: (gelenDeger) => print("e-mail :  $gelenDeger"),
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
            onSaved: (gelenDeger) => print("Şifre: $gelenDeger"),
            validator: (girilenVeri) {
              if (girilenVeri.isEmpty && !girilenVeri.contains('@')) {
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

  int _aktifStep = 0;
  String kullaniciAdi, mail, sifre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SolMenu(),
      appBar: AppBar(
        title: Text("My Lessons"),
      ),
      body: SingleChildScrollView(
        child: Stepper(
            steps: _tumStepler(),
            currentStep: _aktifStep,
            onStepTapped: (tiklananStep) {},
            onStepContinue: () {
              setState(() {
                if (_formKey1.currentState.validate()) {
                  if (_aktifStep < _tumStepler().length - 1) {
                    _aktifStep++;
                  }
                }
                if (_formKey2.currentState.validate()) {
                  if (_aktifStep < _tumStepler().length - 1) {
                    _aktifStep++;
                  }
                }
                if (_formKey3.currentState.validate()) {
                  if (_aktifStep < _tumStepler().length - 1) {
                    _aktifStep++;
                  }
                }

                if (_formKey1.currentState.validate() &&
                    _formKey2.currentState.validate() &&
                    _formKey3.currentState.validate()) {
                  _formKey1.currentState.save();
                  _formKey2.currentState.save();
                  _formKey3.currentState.save();
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
    );
  }
}
