import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TarihZamanSeciciHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Tüm Öğrendiklerim",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new TarihZamanSecici(),
    );
  }
}

class TarihZamanSecici extends StatefulWidget {
  @override
  _TarihZamanSeciciState createState() => _TarihZamanSeciciState();
}

class _TarihZamanSeciciState extends State<TarihZamanSecici> {
  String secilenil = "", secilenTarih = "", secilenSaat = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarih Zaman Seçici"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              CupertinoButton.filled(
                child: Text("Cupertino Picker"),
                onPressed: () => _showCupertinoPicker(context),
              ),
              Divider(
                height: 15,
              ),
              Container(
                child: Text(secilenil,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold)),
              ),
              Divider(
                height: 15,
              ),
              CupertinoButton.filled(
                child: Text("Cupertino Date Picker"),
                onPressed: () => _showCupertinoDatePicker(context),
              ),
              Divider(
                height: 15,
              ),
              Container(
                child: Text(secilenTarih,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold)),
              ),
              Divider(
                height: 15,
              ),
              CupertinoButton.filled(
                child: Text("Cupertino Time Picker"),
                onPressed: () => _showCupertinoTimePicker(context),
              ),
              Divider(
                height: 15,
              ),
              Container(
                child: Text(secilenSaat,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showCupertinoPicker(BuildContext ctx) {
    final picker = CupertinoPicker(
      itemExtent: 40,
      onSelectedItemChanged: (position) {
        setState(() {
          switch (position) {
            case 0:
              secilenil = "Seçilen ilin pozisyonu:  $position ve İl İzmir ";
              break;
            case 1:
              secilenil = "Seçilen ilin pozisyonu:  $position ve İl İstanbul ";
              break;
            case 2:
              secilenil = "Seçilen ilin pozisyonu:  $position ve İl Ankara ";
              break;
            case 3:
              secilenil = "Seçilen ilin pozisyonu:  $position ve İl Kastamonu ";
              break;
            case 4:
              secilenil = "Seçilen ilin pozisyonu:  $position ve İl Elazığ ";
              break;
          }
        });
      },
      children: <Widget>[
        Center(child: Text("İzmir")),
        Center(child: Text("İstanbul")),
        Center(child: Text("Ankara")),
        Center(child: Text("Kastamonu")),
        Center(child: Text("Elazığ")),
      ],
    );
    showCupertinoModalPopup(
      context: ctx,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.tealAccent,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          margin: EdgeInsets.all(10),
          height: 150,
          child: picker,
        );
      },
    );
  }

  void _showCupertinoDatePicker(BuildContext ctx) {
    final picker = CupertinoDatePicker(
      maximumYear: 2020,
      minimumYear: 1930,
      use24hFormat: true,
      mode: CupertinoDatePickerMode.date,
      onDateTimeChanged: (date) {
        setState(() {
          secilenTarih = "Seçilen tarih:  ${date.toString()}";
        });
      },
      initialDateTime: DateTime(2020),
    );
    showCupertinoModalPopup(
      context: ctx,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          margin: EdgeInsets.all(10),
          height: 200,
          child: picker,
        );
      },
    );
  }

  void _showCupertinoTimePicker(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (BuildContext context) => Container(
        child: CupertinoTimerPicker(
          mode: CupertinoTimerPickerMode.hms,
          initialTimerDuration: Duration(milliseconds: 200),
          minuteInterval: 1,
          secondInterval: 1,
          onTimerDurationChanged: (time) {
            setState(() {
              secilenSaat = "Seçilen saat: ${time.toString()}";
            });
          },
        ),
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        margin: EdgeInsets.all(10),
        height: 200,
      ),
    );
  }
}
