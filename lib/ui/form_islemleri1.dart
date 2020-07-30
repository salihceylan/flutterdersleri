import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';





class FormIslemleri1 extends StatefulWidget {
  @override
  _FormIslemleri1State createState() => _FormIslemleri1State();
}

class _FormIslemleri1State extends State<FormIslemleri1> {
  String merhaba = "";

  FocusNode _fNode;
  TextEditingController _textEditingController;
  int maxLine = 1, maxLine2 = 1;

  @override
  void initState() {
    super.initState();
    _textEditingController=TextEditingController();
    _textEditingController.addListener(() {
      final text = _textEditingController.text.toLowerCase();
      _textEditingController.value = _textEditingController.value.copyWith(
        text: text,

      );

    });


    _fNode = FocusNode();
    _fNode.addListener(() {
      setState(() {
        if (_fNode.hasFocus) {
          maxLine = 5;
          maxLine2 = 1;
        } else {
          maxLine = 1;
          maxLine2 = 5;
        }
      });
    });
  }

  @override
  void dispose() {
    _fNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 25,
            height: 25,
            child: FloatingActionButton(
              backgroundColor: Colors.blue,
              child: Icon(Icons.accessible, size: 12),
              onPressed: () {
                debugPrint(_textEditingController.text.toUpperCase());
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          FloatingActionButton(
            mini: true,
            backgroundColor: Colors.purple,
            child: Icon(Icons.accessible),
            onPressed: () {
              FocusScope.of(context).requestFocus(_fNode);
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          FloatingActionButton(
            child: Icon(Icons.accessible),
            backgroundColor: Colors.orange,
            onPressed: () {
              FocusScope.of(context).requestFocus(_fNode);
            },
          ),
        ],
      ),
      appBar: AppBar(title: Text("Form İşlemleri")),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.center,
              child: TextField(
                controller: _textEditingController,
                autofocus: false,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: maxLine,
                maxLength: 20,
                onChanged: (String s) {
                  setState(() {
                    merhaba = s;
                  });
                },
                onSubmitted: (String s) => merhaba = s,
                keyboardAppearance: Brightness.light,
                decoration: InputDecoration(
                  focusColor: Colors.red.shade200,
                  filled: true,
                  labelText: "Burası Başlık",
                  hintText: "Buraya Yazınız...",
                  fillColor: Colors.red.shade50,
                  icon: Icon(Icons.access_time),
                  prefixIcon: Icon(Icons.done_all),
                  suffixIcon: Icon(Icons.edit),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                focusNode: _fNode,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.center,
              child: TextField(
                autofocus: false,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: maxLine2,
                maxLength: 20,
                onChanged: (String s) {
                  setState(() {
                    merhaba = s;
                  });
                },
                onSubmitted: (String s) => merhaba = s,
                keyboardAppearance: Brightness.light,
                decoration: InputDecoration(
                  focusColor: Colors.red.shade200,
                  filled: true,
                  labelText: "Burası Başlık",
                  hintText: "Buraya Yazınız...",
                  fillColor: Colors.red.shade50,
                  icon: Icon(Icons.access_time),
                  prefixIcon: Icon(Icons.done_all),
                  suffixIcon: Icon(Icons.edit),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(1.0),
            color: Colors.amberAccent,
            //  width: double.infinity,
            //  height: MediaQuery.of(context).size.height,

            width: double.infinity,
            height: 50,
            child: Align(
              alignment: Alignment.center,
              child: Text(merhaba),
            ),
          ),
          Container(
            margin: EdgeInsets.all(1.0),
            color: Colors.amberAccent,
            //  width: double.infinity,
            //  height: MediaQuery.of(context).size.height,

            width: double.infinity,
            height: 50,
            child: Align(
              alignment: Alignment.center,
              child: Text(merhaba),
            ),
          ),
        ],
      ),
    );
  }
}
