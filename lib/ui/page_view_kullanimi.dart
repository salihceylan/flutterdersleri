import 'package:flutter/material.dart';
import 'sol_menu.dart';

class PageViewKullanimiHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageViewKullanimi();
  }
}

class PageViewKullanimi extends StatefulWidget {
  @override
  _PageViewKullanimiState createState() => _PageViewKullanimiState();
}

class _PageViewKullanimiState extends State<PageViewKullanimi> {
  var myPageController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);

  var sayfaScrollYatayDirection = true;
  var sayfaReverse = false;
  var sayfaSnapping = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SolMenu(),
      appBar: AppBar(
        title: Text("Page View Kullanımı"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: PageView(
              scrollDirection:
                  sayfaScrollYatayDirection ? Axis.horizontal : Axis.vertical,
              controller: myPageController,
              reverse: sayfaReverse,
              pageSnapping: sayfaSnapping,
              onPageChanged: (index) {
                print("sayfa indexi $index");
              },
              children: <Widget>[
                sayfa1(),
                sayfa2(),
                sayfa3(),
                Sayfa4(),
                Sayfa5(),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                color: Colors.greenAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_left),
                          iconSize: 35,
                          onPressed: () {
                            setState(() {
                              myPageController.previousPage(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.linear,
                              );
                            });
                          },
                        ),
                        GestureDetector(
                          child: Text("Sayfa 1   "),
                          onTap: () {
                            setState(() {
                              myPageController.jumpToPage(0);
                            });
                          },
                        ),
                        GestureDetector(
                          child: Text("Sayfa 2    "),
                          onTap: () {
                            setState(() {
                              myPageController.jumpToPage(1);
                            });
                          },
                        ),
                        GestureDetector(
                          child: Text("Sayfa 3  "),
                          onTap: () {
                            setState(() {
                              myPageController.jumpToPage(2);
                            });
                          },
                        ),
                        GestureDetector(
                          child: Text("Sayfa 4  "),
                          onTap: () {
                            setState(() {
                              myPageController.jumpToPage(3);
                            });
                          },
                        ),
                        GestureDetector(
                          child: Text("Sayfa 5"),
                          onTap: () {
                            setState(() {
                              myPageController.jumpToPage(4);
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_right),
                          iconSize: 35,
                          onPressed: () {
                            setState(() {
                              myPageController.nextPage(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.linear,
                              );
                            });
                          },
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    Row(
                      children: <Widget>[
                        Text("Yatay/Dikey"),
                        Checkbox(
                          value: sayfaScrollYatayDirection,onChanged: (d){setState(() {
                            sayfaScrollYatayDirection=d;
                          });},
                        ),
                        Text("Reverse?"),
                        Checkbox(

                          value: sayfaReverse,
                          onChanged: (d){setState(() {
                            sayfaReverse=d;
                          });},
                        ),
                        Text("Snapping?"),
                        Checkbox(
                          value: sayfaSnapping,
                          onChanged: (d){setState(() {
                            sayfaSnapping=d;
                          });},
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget sayfa1() {
    return Container(
      margin: EdgeInsets.all(5),
      color: Colors.blue,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Text(
          "1. Sayfa Metod içinde çalışan",
          style: TextStyle(fontSize: 35),
        ),
      ),
    );
  }

  Widget sayfa2() {
    return Container(
      margin: EdgeInsets.all(5),
      color: Colors.yellowAccent,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Text(
          "2. Sayfa Metod içinde çalışan",
          style: TextStyle(fontSize: 35),
        ),
      ),
    );
  }

  Widget sayfa3() {
    return Container(
      margin: EdgeInsets.all(5),
      color: Colors.tealAccent,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Text(
          "3. Sayfa Metod içinde çalışan",
          style: TextStyle(fontSize: 35),
        ),
      ),
    );
  }
}

class Sayfa4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      color: Colors.green,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Text(
          "4. Sayfa Stateless Class içinde çalışan",
          style: TextStyle(fontSize: 35),
        ),
      ),
    );
  }
}

class Sayfa5 extends StatefulWidget {
  @override
  _Sayfa5State createState() => _Sayfa5State();
}

class _Sayfa5State extends State<Sayfa5> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      color: Colors.deepOrangeAccent,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Text(
          "5. Sayfa Stateful Class içinde çalışan",
          style: TextStyle(fontSize: 35),
        ),
      ),
    );
  }
}
