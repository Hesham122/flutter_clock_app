import 'dart:async';
import 'package:flutter_clock_app/bottomappbar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clock_app/constant/colors.dart';

class Pomodoro extends StatefulWidget {
  const Pomodoro({super.key});

  @override
  State<Pomodoro> createState() => _CountDwonState();
}

class _CountDwonState extends State<Pomodoro> {
  bool isRun = false;
  Duration duration = const Duration(minutes: 25);
  Timer? repeated;
  startcount() {
    repeated = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        int newsec = duration.inSeconds - 1;
        duration = Duration(seconds: newsec);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircularPercentIndicator(
              radius: 160.0,
              animation: true,
              animationDuration: 1200,
              lineWidth: 8.0,
              percent: duration.inMinutes / 25.0,
              backgroundColor: Colors.red,
              center: Text(
                "${duration.inMinutes.remainder(60).toString().padLeft(2, "0")}:${duration.inSeconds.remainder(60).toString().padLeft(2, "0")}",
                style: const TextStyle(color: Colors.white, fontSize: 77),
              ),
              progressColor: Colors.blue,
              circularStrokeCap: CircularStrokeCap.butt,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          isRun
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (repeated!.isActive) {
                          setState(() {
                            repeated!.cancel();
                          });
                        } else {
                          startcount();
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.red),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11)))),
                      child: Text(
                        (repeated!.isActive) ? "Stop" : "Resume",
                        style: const TextStyle(fontSize: 27),
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        repeated!.cancel();
                        setState(() {
                          duration = const Duration(minutes: 25);
                          isRun = false;
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.red),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11)))),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(fontSize: 27),
                      ),
                    ),
                  ],
                )
              : ElevatedButton(
                  onPressed: () {
                    startcount();
                    isRun = true;
                  },
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11)))),
                  child: const Text(
                    "Start",
                    style: TextStyle(fontSize: 27),
                  ),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, "/timenow");
      },
      child: const Icon(Icons.access_time_sharp),
      
      elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const Bottomappbar(),
    );
  }
}
