import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int countt;
  final int alltsk;
  Counter({super.key, required this.countt, required this.alltsk});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Text("$countt/${alltsk}",style: TextStyle(fontSize: 45, color:countt==alltsk? Colors.green:Colors.white),)
    );
  }
}
