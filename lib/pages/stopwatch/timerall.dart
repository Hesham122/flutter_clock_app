import 'package:flutter/material.dart';

class TimerAll extends StatelessWidget {
  final String duration;
  final String text;
   TimerAll({super.key, required this.duration, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(11),
        
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(11)
            ),
            child: Text(
              duration,
              style: TextStyle(color: Colors.black, fontSize: 70),
            ),
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 22),
          )
        ],
      ),
    );
  }
}
