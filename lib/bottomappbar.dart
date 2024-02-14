import 'package:flutter/material.dart';
import 'package:flutter_clock_app/constant/colors.dart';

class Bottomappbar extends StatelessWidget {
  const Bottomappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: main_appbar_color,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.assignment,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "/todo");
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.timer,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "/stopwatch");
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.hourglass_bottom,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "/pomodoro");
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.public,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "/worldtime");
            },
          ),
        ],
      ),
    );
  }
}
