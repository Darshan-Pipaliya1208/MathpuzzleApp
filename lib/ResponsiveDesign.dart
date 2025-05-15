// Responsive Design
// Screen Width , Height
import 'package:flutter/material.dart';

class MyResponiveDesign extends StatefulWidget {
  const MyResponiveDesign({super.key});

  @override
  State<MyResponiveDesign> createState() => _MyResponiveDesignState();
}

class _MyResponiveDesignState extends State<MyResponiveDesign> {
  @override
  Widget build(BuildContext context) {
    double totalwidth = MediaQuery.of(context).size.width; // Full page width
    double totalheight = MediaQuery.of(context).size.height; // Full page hight
    double appbarheight = kToolbarHeight; // Appbar height
    double bottomheight = MediaQuery.of(context).padding.bottom; // Bottom Navigator height
    double statusbarheight = MediaQuery.of(context).padding.top; // Statusbar height
    double bodyheight =totalheight /*- appbarheight - statusbarheight*/ - bottomheight ; // Body height

    return Scaffold(
      // appBar: AppBar(title: Text("zhdhg"),),
      body: totalwidth > 600
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    color: Colors.red,
                    height: bodyheight * 0.5,
                    width: 300,
                    child: Text(
                        "Screen AAAAAAAAAAAAAAAAAAAAAAAAAA Width : $totalwidth  \n Screen Height : $totalheight",style: TextStyle(fontSize: bodyheight*0.05),)),
                Container(
                    color: Colors.pink,
                    height: bodyheight * 0.5,
                    width: 300,
                    child: Text(
                          "Screen AAAAAAAAAAAAAAAAAAAAAAAAAAA Width : $totalwidth  \n Screen Height : $totalheight")),
              ],
            )
          : Column(
              children: [
                Container(
                    color: Colors.pink,
                    height: bodyheight * 0.5,
                    width: 300,
                    child: Text(
                      "Screen Width : $totalwidth  \n Screen Height : $totalheight",style: TextStyle(fontSize: bodyheight*0.05),)),
                Container(
                    color: Colors.red,
                    height: bodyheight * 0.5,
                    width: 300,
                    child: Text(
                        "Screen Width : $totalwidth  \n Screen Height : $totalheight")),
              ],
            ),
    );
  }
}
