import 'package:flutter/material.dart';
import 'package:mathspuzzlenew/firstpage.dart';
import 'package:mathspuzzlenew/subCont.dart';

class subPuzz extends StatefulWidget {
  const subPuzz({super.key});

  @override
  State<subPuzz> createState() => _subPuzzState();
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

class _subPuzzState extends State<subPuzz> {
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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => firstpage()),
        );
        return Future.value(false);
      },
      child: Scaffold(
        body: Center(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 22),
                  child: Center(
                    child: Text(
                      'Select Puzzle',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'fofont',
                      ),
                    ),
                  ),
                ),
                Container(
                  height: totalheight * 0.82,
                  width: totalwidth * 0.9,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // Number of columns
                    ),
                    itemCount: 75,
                    itemBuilder: (context, index) {
                      // 0,1...

                      int level = firstpage.prefs!.getInt("level") ?? 1;
                      String levelsttus = firstpage.statuslist[index];
                      if (levelsttus == "clear") {
                        return InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => subCont(index + 1)),
                            );
                          },
                          child: Container(
                            child: Center(
                                child: Text(
                              "${index + 1}",
                              style: TextStyle(fontSize: 30),
                            )),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/tick.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      } else if (levelsttus == "skip") {
                        return InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => subCont(index + 1)),
                            );
                          },
                          child: Container(
                            child: Center(
                                child: Text(
                              "${index + 1}",
                              style: TextStyle(fontSize: 30),
                            )),
                          ),
                        );
                      } else {
                        if (level - 1 == index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => subCont(index + 1)),
                              );
                            },
                            child: Container(
                              child: Center(
                                  child: Text(
                                "${index + 1}",
                                style: TextStyle(fontSize: 30),
                              )),
                            ),
                          );
                        } else {
                          return Container(
                            height: totalheight*0.1,
                            width: totalwidth *0.1,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/lock.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }
                      }
                    },
                    padding: EdgeInsets.all(10), // Padding around the grid
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
