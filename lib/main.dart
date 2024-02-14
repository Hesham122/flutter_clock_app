import 'package:flutter/material.dart';
import 'package:flutter_clock_app/pages/Todo/todo.dart';
import 'package:flutter_clock_app/pages/stopwatch/stopwatch.dart';
import 'package:flutter_clock_app/pages/pomodoro/pomodoro.dart';
import 'package:flutter_clock_app/pages/timenow/timenow.dart';
import 'package:flutter_clock_app/pages/worldtimeapi/loaction.dart';
import 'package:flutter_clock_app/pages/worldtimeapi/worldapi.dart';
import 'pages/worldtimeapi/home.dart';
void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/todo",
      routes: {
        "/todo":(context) => const Todo(),
        "/stopwatch":(context) => const Stopwatch(),
        "/pomodoro":(context) => const Pomodoro(),
        "/worldtime":(context) => const Loading(),
        "/home": (context) => const Home(),
        "/location": (context) => const Location(),
        "/timenow": (context) => const TimeNow(),

      },
    );
  }
}

