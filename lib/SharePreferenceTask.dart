import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceTask extends StatefulWidget {
  const SharePreferenceTask({super.key});

  @override
  State<SharePreferenceTask> createState() => _SharePreferenceTaskState();
}

class _SharePreferenceTaskState extends State<SharePreferenceTask> {
  int? a;
  SharedPreferences? prefs;

  getSharepreference() async {
    prefs = await SharedPreferences.getInstance();
    a = prefs!.getInt("Darshan") ?? 88;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getSharepreference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "$a",
        style: TextStyle(fontSize: 30),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            a = a! + 1;
            prefs!.setInt("Darshan", a!);
          });
        },
      ),
    );
  }
}
