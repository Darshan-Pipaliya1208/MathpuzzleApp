import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mathspuzzlenew/subCont.dart';
import 'package:share_plus/share_plus.dart';

import 'firstpage.dart';

class win extends StatefulWidget {
  int level;

  win(this.level);

  @override
  State<win> createState() => _winState();
}

class _winState extends State<win> {
  @override
  void initState() {
    super.initState();
    print("==3=${widget.level}");
  }

  @override
  Widget build(BuildContext context) {
    double totalwidth = MediaQuery.of(context).size.width; // Full page width
    double totalheight = MediaQuery.of(context).size.height; // Full page hight
    double appbarheight = kToolbarHeight; // Appbar height
    double bottomheight =
        MediaQuery.of(context).padding.bottom; // Bottom Navigator height
    double statusbarheight =
        MediaQuery.of(context).padding.top; // Statusbar height
    double bodyheight = totalheight /* - appbarheight - statusbarheight */ -
        bottomheight; // Body height
    // Navigator.pop(
    //   context,
    //   MaterialPageRoute(builder: (context) => subCont(widget.level)),
    // );
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => firstpage()),
        );
        return Future.value(false);
      },
      child: Scaffold(
        body: Expanded(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: totalheight*0.02,
                ),
                Center(
                  child: Text(
                    "PUZZLE ${widget.level} COMPLETED",
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'fofont',
                    ),
                  ),
                ),
                SizedBox(
                  height: totalheight * 0.07,
                ),
                Container(
                  height: totalheight * 0.4,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/trophy.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: totalheight * 0.03,
                ),
                Column(
                  children: [
                    GFButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => subCont(widget.level + 1)),
                        );
                        // Get.to(subCont(widget.level+1));
                      },
                      text: "CONTINUE",
                      textStyle: TextStyle(
                          fontSize: 30,
                          fontFamily: "ffont",
                          color: Colors.brown),
                      shape: GFButtonShape.pills,
                      color: Colors.cyan.shade400,
                    ),
                    GFButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => firstpage()),
                        );
                        // Get.to(firstpage());
                      },
                      text: "MAIN MENU",
                      textStyle: TextStyle(
                          fontSize: 30,
                          fontFamily: "ffont",
                          color: Colors.brown),
                      shape: GFButtonShape.pills,
                      color: Colors.cyan.shade400,
                    ),
                    GFButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: Container(
                              height: totalheight * 0.23,
                              width: totalwidth * 0.3,
                              child: Column(
                                children: [
                                  Text(
                                    "Benifites of pro version ",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: "thfont",
                                      color: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(
                                    height: totalheight * 0.01,
                                  ),
                                  Text(
                                    "1. No Ads \n2. No wait time for hint and skip \n3. Hint for avery level \n4. Solution for avery level",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: totalheight * 0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GFButton(
                                        onPressed: () {},
                                        child: Text("BUY"),
                                      ),
                                      GFButton(
                                        onPressed: () {
                                          Navigator.pop(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    win(widget.level)),
                                          );
                                        },
                                        child: Text("NO THANKS"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      text: "BUY PRO",
                      textStyle: TextStyle(
                          fontSize: totalheight * 0.036,
                          fontFamily: "ffont",
                          color: Colors.brown),
                      shape: GFButtonShape.pills,
                      color: Colors.cyan.shade400,
                    ),
                    SizedBox(
                      height: totalheight * 0.05,
                    ),
                    Text(
                      "Share puzzle",
                      style: TextStyle(fontSize: totalheight * 0.05, fontFamily: 'thfont'),
                    ),
                    SizedBox(
                      height: totalheight * 0.05,
                    ),
                    GFIconButton(
                      onPressed: () {
                        Share.share(
                            'https://play.google.com/store/apps/details?id=math.puzzle.games.crossmath.number.puzzles.free&hl=en',
                            subject:
                                'Test your logical reasoning.Download and Enjoy!!!');
                      },
                      color: Colors.teal.shade900,
                      icon: Icon(
                        Icons.share,
                        color: Colors.greenAccent,
                      ),
                      shape: GFIconButtonShape.pills,
                    ),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.png',
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
