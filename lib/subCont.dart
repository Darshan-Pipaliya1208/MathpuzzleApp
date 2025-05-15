import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mathspuzzlenew/win.dart';

import 'firstpage.dart';

class subCont extends StatefulWidget {
  int level;

  subCont(this.level);

  @override
  State<subCont> createState() => _subContState();
}

List ansLst = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '19',
  '20',
  '21',
  '22',
  '23',
  '24',
  '25',
  '26',
  '27',
  '28',
  '29',
  '30',
  '31',
  '32',
  '33',
  '34',
  '35',
  '36',
  '37',
  '38',
  '39',
  '40',
  '41',
  '42',
  '43',
  '44',
  '45',
  '46',
  '47',
  '48',
  '49',
  '50',
  '51',
  '52',
  '53',
  '54',
  '55',
  '56',
  '57',
  '58',
  '59',
  '60',
  '61',
  '62',
  '63',
  '64',
  '65',
  '66',
  '67',
  '68',
  '69',
  '70',
  '71',
  '72',
  '73',
  '74',
  '75',
];

List<String> imagePaths = [
  'assets/images/p1.png',
  'assets/images/p2.png',
  'assets/images/p3.png',
  'assets/images/p4.png',
  'assets/images/p5.png',
  'assets/images/p6.png',
  'assets/images/p7.png',
  'assets/images/p8.png',
  'assets/images/p9.png',
  'assets/images/p10.png',
  'assets/images/p11.png',
  'assets/images/p12.png',
  'assets/images/p13.png',
  'assets/images/p14.png',
  'assets/images/p15.png',
  'assets/images/p16.png',
  'assets/images/p17.png',
  'assets/images/p18.png',
  'assets/images/p19.png',
  'assets/images/p20.png',
  'assets/images/p21.png',
  'assets/images/p22.png',
  'assets/images/p23.png',
  'assets/images/p24.png',
  'assets/images/p25.png',
  'assets/images/p26.png',
  'assets/images/p27.png',
  'assets/images/p28.png',
  'assets/images/p29.png',
  'assets/images/p30.png',
  'assets/images/p31.png',
  'assets/images/p32.png',
  'assets/images/p33.png',
  'assets/images/p34.png',
  'assets/images/p35.png',
  'assets/images/p36.png',
  'assets/images/p37.png',
  'assets/images/p38.png',
  'assets/images/p39.png',
  'assets/images/p40.png',
  'assets/images/p41.png',
  'assets/images/p42.png',
  'assets/images/p43.png',
  'assets/images/p44.png',
  'assets/images/p45.png',
  'assets/images/p46.png',
  'assets/images/p47.png',
  'assets/images/p48.png',
  'assets/images/p49.png',
  'assets/images/p50.png',
  'assets/images/p51.png',
  'assets/images/p52.png',
  'assets/images/p53.png',
  'assets/images/p54.png',
  'assets/images/p55.png',
  'assets/images/p56.png',
  'assets/images/p57.png',
  'assets/images/p58.png',
  'assets/images/p59.png',
  'assets/images/p60.png',
  'assets/images/p61.png',
  'assets/images/p62.png',
  'assets/images/p63.png',
  'assets/images/p64.png',
  'assets/images/p65.png',
  'assets/images/p66.png',
  'assets/images/p67.png',
  'assets/images/p68.png',
  'assets/images/p69.png',
  'assets/images/p70.png',
  'assets/images/p71.png',
  'assets/images/p72.png',
  'assets/images/p73.png',
  'assets/images/p74.png',
  'assets/images/p75.png',
];

class _subContState extends State<subCont> {
  String displayvalue = '';

  @override
  void initState() {
    super.initState();
    print("==2=${widget.level}");
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
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  "Alert",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.red[400]),
                ),
                content: Text("Do you want to Exit.",style: TextStyle(fontSize: 20,),),
                actions: [
                  ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text("No",style: TextStyle(fontSize: 20),)),
                  SizedBox(
                    width: 75,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => firstpage()),
                        );
                      },
                      child: Text("Exit",style: TextStyle(fontSize: 20),)),
                ],
              );
            });
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
        body: Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/gameplaybac.jpg',
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 110,
                    ),
                    InkWell(
                      onTap: () {
                        if (firstpage.statuslist[widget.level - 1] == "lock") {
                          firstpage.statuslist[widget.level - 1] = "skip";
                          firstpage.prefs!
                              .setString("status${widget.level}", "skip");
                          widget.level = widget.level + 1;
                          firstpage.prefs!.setInt("level", widget.level);
                          setState(() {});
                          Text(
                            "Puzzle ${widget.level}",
                            style: TextStyle(fontSize: 30),
                          );
                        } else if (firstpage.statuslist[widget.level - 1] ==
                            "skip") {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: Container(
                                margin: EdgeInsets.only(left: 15),
                                height: 100,
                                child: Center(
                                  child: Text(
                                    "This puzzle already skiped, you can't skip this puzzle!!!",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "thfont",
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: Container(
                                height: 100,
                                margin: EdgeInsets.only(left: 15),
                                child: Center(
                                  child: Text(
                                    "This puzzle already cleared, you can't skip this puzzle!!!",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "ffont",
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      child: Container(
                        height: bodyheight * 0.1,
                        width: totalwidth * 0.1,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/skip.png',
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Center(
                            child: Text(
                          "Puzzle ${widget.level}",
                          style: TextStyle(
                              fontSize: 33, fontWeight: FontWeight.bold),
                        )),
                        height: bodyheight * 0.1,
                        width: totalwidth * 0.1,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/level_board.png',
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: Container(
                              height: 100,
                              child: Column(
                                children: [
                                  Text(
                                    "Hello hint",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: "thfont",
                                      color: Colors.green,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GFButton(
                                        onPressed: () {
                                          Navigator.pop(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    subCont(widget.level)),
                                          );
                                        },
                                        child: Text("OK"),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: bodyheight * 0.1,
                        width: totalwidth * 0.1,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/hintt.png',
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          '${imagePaths[widget.level - 1]}',
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              alignment: Alignment.bottomRight,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  maxLines: 1,
                                  displayvalue,
                                  style: const TextStyle(
                                      fontSize: 30, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          GFIconButton(
                            onPressed: () {
                              if (displayvalue.isNotEmpty) {
                                displayvalue = displayvalue.substring(
                                    0, displayvalue.length - 1);
                              } else {
                                displayvalue = '';
                                setState(() {});
                              }
                              displayvalue.substring(
                                  0, displayvalue.length - 1);
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.chevron_left,
                            ),
                            shape: GFIconButtonShape.square,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          GFButton(
                            onPressed: () {
                              if (displayvalue == ansLst[widget.level - 1]) {
                                String levelsttus =
                                    firstpage.statuslist[widget.level - 1];
                                if (levelsttus == "lock") {
                                  setState(() {});
                                  firstpage.statuslist[widget.level - 1] =
                                      "clear";
                                  firstpage.prefs!.setString(
                                      "status${widget.level}", "clear");
                                  widget.level = widget.level + 1;
                                  firstpage.prefs!
                                      .setInt("level", widget.level);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            win(widget.level - 1)),
                                  );
                                  displayvalue = '';
                                } else if (levelsttus == "skip") {
                                  setState(() {});
                                  firstpage.statuslist[widget.level - 1] =
                                      "clear";
                                  firstpage.prefs!.setString(
                                      "status${widget.level}", "clear");
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            win(widget.level)),
                                  );
                                  displayvalue = '';
                                } else {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            win(widget.level)),
                                  );
                                  displayvalue = '';
                                }
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Wrong !",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.grey,
                                    textColor: Colors.white,
                                    fontSize: 25.0);
                              }
                            },
                            text: "SUBMIT",
                            textStyle: TextStyle(fontSize: 20),
                            shape: GFButtonShape.pills,
                          ),
                        ],
                      ),
                      Container(
                        height: 70,
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 10,
                            crossAxisSpacing: 5,
                          ),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: InkWell(
                                onTap: () {
                                  getvalue('$index');
                                },
                                child: Center(
                                  child: Text(
                                    '${index}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getvalue(String s) {
    if (displayvalue == "") {
      displayvalue = s;
    } else {
      displayvalue += s;
    }
    setState(() {});
  }
}

// todo Shareprefrence | Local Storage | Cache | Temp
// 10 Spelling
// Sentance
//
// 10 typing wpm
// intiative  = Starting
// commence = Start
//
// You are amy favorite sir
