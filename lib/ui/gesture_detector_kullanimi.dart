import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GestureDetectorKullanimi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 125,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 5),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => Fluttertoast.showToast(msg: "OnTap"),
            onDoubleTap: () => Fluttertoast.showToast(
              fontSize: 35,
              textColor: Colors.red,
              gravity: ToastGravity.CENTER,
              msg: "$index OnDoubleTap",
              toastLength: Toast.LENGTH_SHORT,
            ),
            onHorizontalDragDown: (e) => Fluttertoast.showToast(
                fontSize: 35,
                textColor: Colors.red,
                gravity: ToastGravity.CENTER,
                msg: "$index HorizontalDragDeon" + e.toString()),
            onLongPress: () => Fluttertoast.showToast(
                fontSize: 35,
                textColor: Colors.red,
                gravity: ToastGravity.CENTER,
                msg: "$index OnLongPress",
                toastLength: Toast.LENGTH_SHORT),
            onLongPressUp: () => Fluttertoast.showToast(
                fontSize: 35,
                textColor: Colors.red,
                gravity: ToastGravity.CENTER,
                msg: "$index OnLongPressUp",
                toastLength: Toast.LENGTH_SHORT),
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  new Radius.circular(20),
                ),
                gradient: LinearGradient(
                  colors: [Colors.yellow, Colors.red],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                /* image: DecorationImage(
                image: AssetImage("assets/images/crm.jpg", ),fit: BoxFit.contain,

              ),

              */
                boxShadow: [
                  new BoxShadow(
                    color: Colors.red,
                    offset: new Offset(20, 10),
                    blurRadius: 20,
                    spreadRadius: 40,
                  ),
                ],
              ),
              margin: EdgeInsets.all(20),
              child: Text(
                "Container $index",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        });
  }
}
