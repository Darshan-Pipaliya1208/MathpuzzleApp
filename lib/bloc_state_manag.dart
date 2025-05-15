import 'package:flutter/material.dart';

class Bloc extends StatelessWidget {
  const Bloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                hintText: "Username",
                hintTextDirection: TextDirection.ltr),
          ),
          SizedBox(
            height: 1,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Password",
                hintTextDirection: TextDirection.ltr),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: () {}, child: Text("Login"))
        ],
      ),
    );
  }
}
