import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mathspuzzlenew/subPuzz.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'subCont.dart';

class firstpage extends StatefulWidget {
  static List statuslist = [];
  static SharedPreferences? prefs;

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  int? level;

  getSharepreference() async {
    firstpage.prefs = await SharedPreferences.getInstance();
    level = firstpage.prefs!.getInt("level") ?? 1;

    for (int i = 1; i <= 75; i++) {
      String levelstatus = firstpage.prefs!.getString("status${i}") ?? "lock";
      // [lock,clear,skip]
      firstpage.statuslist.add(levelstatus);
    }
    print("=====${firstpage.statuslist}");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getSharepreference();
  }

  // bool backpressed() {
  //   final value = showDialog<bool>(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text(
  //             "Alert",
  //             style: TextStyle(
  //                 fontWeight: FontWeight.bold, fontSize: 40, color: Colors.red),
  //           ),
  //           content: Text(
  //             "Do you want to Exit",
  //             style: TextStyle(fontSize: 20),
  //           ),
  //           actions: [
  //             GFButton(
  //               onPressed: () => Navigator.of(context).pop(false),
  //               text: "No",
  //               shape: GFButtonShape.pills,
  //             ),
  //             SizedBox(
  //               width: 75,
  //             ),
  //             GFButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop(false);
  //                 SystemNavigator.pop();
  //               },
  //               text: "Exit",
  //               shape: GFButtonShape.pills,
  //             ),
  //           ],
  //         );
  //       });
  //   return true;
  // }

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
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Do you really want to exit?"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: Text("Yes")),
                  ],
                ));
      },
      child: Scaffold(
        body: Center(
          child: Container(
            height: totalheight,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Math Puzzles",
                  style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(7.0, 7.0),
                          blurRadius: 8.0,
                          color: Color.fromARGB(60, 0, 0, 0),
                        ),
                        Shadow(
                          offset: Offset(1.0, 6.0),
                          blurRadius: 9.0,
                          color: Color.fromARGB(125, 0, 0, 200),
                        ),
                      ],
                      fontSize: 45,
                      fontFamily: 'fofont',
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: totalheight * 0.6,
                      margin: EdgeInsets.all(totalheight * 0.02),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            shadowColor: Colors.white,
                            elevation: 10,
                            color: Colors.lightBlueAccent,
                            child: GFButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => subCont(level!),
                                  ),
                                );
                                // Get.to(subCont(level!), duration: Duration(seconds: 1));
                              },
                              text: "CONTUNUE",
                              color: Colors.lightBlueAccent,
                              textStyle: TextStyle(
                                  fontFamily: 'ffont',
                                  fontSize: totalheight * 0.04,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(height: totalheight * 0.02,),
                          Card(
                            shadowColor: Colors.white,
                            elevation: 10,
                            color: Colors.lightBlueAccent,
                            child: GFButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => subPuzz()),
                                );
                                // Get.to(subPuzz(), duration: Duration(seconds: 1));
                              },
                              text: "PUZZLES",
                              color: Colors.lightBlueAccent,
                              textStyle: TextStyle(
                                  fontFamily: 'ffont',
                                  fontSize: totalheight * 0.04,
                                  color: Colors.black),
                            ),
                          ),SizedBox(height: totalheight * 0.02,),
                          Card(
                            shadowColor: Colors.white,
                            elevation: 10,
                            color: Colors.lightBlueAccent,
                            child: GFButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    child: Container(
                                      height: totalheight * 0.23,
                                      child: Column(
                                        children: [
                                          Text(
                                            "Benifites of pro version ",
                                            style: TextStyle(
                                              fontSize: totalheight * 0.03,
                                              fontFamily: "thfont",
                                              color: Colors.blue,
                                            ),
                                          ),
                                          SizedBox(
                                            height: totalheight * 0.01,
                                          ),
                                          Text(
                                            "1. No Ads \n2. No wait time for hint and skip \n3. Hint for avery level \n4. Solution for avery level",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: totalheight * 0.001,
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
                                                            firstpage()),
                                                    // Future.delayed(Duration(seconds: 0), () {
                                                    //   Get.back(result: firstpage(),);
                                                    // }
                                                  );
                                                },
                                                child: Text("NO THANKS"),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              text: "BUY PRO",
                              color: Colors.lightBlueAccent,
                              textStyle: TextStyle(
                                  fontFamily: 'ffont',
                                  fontSize: totalheight * 0.04,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/blackboard_main_menu.png',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          'AD',
                          style: TextStyle(
                              fontFamily: 'tfont',
                              fontSize: totalheight * 0.03,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigoAccent),
                        ),
                        Container(
                          height: totalheight * 0.09,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              // alignment: AlignmentDirectional.bottomStart,
                              image: AssetImage(
                                'assets/images/ltlicon.png',
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: totalwidth * 0.3,
                    ),
                    GFIconButton(
                      onPressed: () {
                        Share.share(
                            'https://play.google.com/store/apps/details?id=math.puzzle.games.crossmath.number.puzzles.free&hl=en',
                            subject:
                                'Test your logical reasoning.Download and Enjoy!!!');
                      },
                      color: Colors.black38,
                      buttonBoxShadow: true,
                      icon: Icon(
                        Icons.share,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                    SizedBox(width: totalwidth * 0.03),
                    GFIconButton(
                      onPressed: () {},
                      color: Colors.black38,
                      buttonBoxShadow: true,
                      icon: Icon(
                        Icons.email_outlined,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                    SizedBox(width: totalwidth * 0.06),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
