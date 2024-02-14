import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_clock_app/bottomappbar.dart';
import 'package:flutter_clock_app/constant/colors.dart';
import 'package:flutter_clock_app/pages/stopwatch/timerall.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  State<Stopwatch> createState() => _TimerState();
}

class _TimerState extends State<Stopwatch> {
  bool isRun = false;
  Duration duration = const Duration(seconds: 0);

  Timer? repeated;
  startcount() {
    repeated = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        int newsec = duration.inSeconds + 1;
        duration = Duration(seconds: newsec);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TimerAll(
                    duration: duration.inHours.toString().padLeft(2, "0"),
                    text: "Hours"),
                TimerAll(
                    duration: duration.inMinutes
                        .remainder(60)
                        .toString()
                        .padLeft(2, "0"),
                    text: "Minutes"),
                TimerAll(
                    duration: duration.inSeconds
                        .remainder(60)
                        .toString()
                        .padLeft(2, "0"),
                    text: "Seconds"),
              ],
            ),
            const SizedBox(
              height: 33,
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
                            duration = const Duration(seconds: 0);
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
