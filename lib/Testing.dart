// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ab extends StatefulWidget {
//   @override
//   State<ab> createState() => _abState();
// }
//
// class _abState extends State<ab> {
//   var nameController = TextEditingController();
//
//   static const String KEYNAME = "name";
//   var nameValue = "no value saved";
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getvalue();
//   }
//   // const ab({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(
//                   label: Text("Name"),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(21))),
//             ),
//             ElevatedButton(
//                 onPressed: () async {
//                   // var name = nameController.text.toString();
//                   var pref = await SharedPreferences.getInstance();
//                   pref.setString(KEYNAME, nameController.text.toString());
//                 },
//                 child: Text("Save")),
//             SizedBox(height: 11,),
//             Text(nameValue),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void getvalue() async{
//     var pref = await SharedPreferences.getInstance();
//     var getName = pref.getString(KEYNAME);
//     nameValue = getName ?? "No value saved";
//     setState(() {});
//   }
// }
