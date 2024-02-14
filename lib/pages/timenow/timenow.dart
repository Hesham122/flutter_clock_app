import 'dart:async';
import 'package:flutter_clock_app/bottomappbar.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clock_app/constant/colors.dart';

class TimeNow extends StatefulWidget {
  const TimeNow({super.key});

  @override
  State<TimeNow> createState() => _TimeNowState();
}

class _TimeNowState extends State<TimeNow> {
  String weekday = "";
  String datenow = "";
  String timenow = "";
  // ignore: non_constant_identifier_names
  Gettime() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        weekday = DateFormat.EEEE().format(DateTime.now());
        datenow = DateFormat.yMMMMd().format(DateTime.now());
        timenow = DateFormat("hh:mm:ss a").format(DateTime.now());
      });
    });
  }

  @override
  void initState() {
    
    super.initState();
    Gettime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: main_appbar_color,
        title: const Text(
          "Time & Date Now",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Today's Date $weekday",
              style: const TextStyle(color: Colors.white, fontSize: 35),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              datenow,
              style: const TextStyle(color: Colors.white, fontSize: 35),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              timenow,
              style: const TextStyle(color: Colors.white, fontSize: 35),
            ),
          ],
        ),
      ),
    floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, "/timenow");
      },
    child: const Icon(Icons.access_time_sharp),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const Bottomappbar()
  
    );
  }
}
