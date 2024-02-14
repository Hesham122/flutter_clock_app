import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class TodoCard extends StatelessWidget {
  final String text;
  final bool check;
  final Function myfunc;
  final int numfunc;
  final Function delete;
  final int delnum;
  TodoCard(
      {super.key,
      required this.text,
      required this.check,
      required this.myfunc,
      required this.numfunc,
      required this.delete,
      required this.delnum});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myfunc(numfunc);
      },
      child: Container(
        decoration: BoxDecoration(
            color: design_color, borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.only(top: 20, right: 9, left: 9),
        padding: const EdgeInsets.all(11),
        width: double.infinity,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
          // ignore: prefer_interpolation_to_compose_strings
          text.length >19 ? text.substring(0, 19)+"\n"+text.substring(19, text.length) : text,
            style: TextStyle(
              fontSize: 25,
              color:check? Colors.black:Colors.white,
              decoration:check? TextDecoration.lineThrough:TextDecoration.none,
            ),
        
        
          ),
          Row(
            children: [
              Icon(
                check ? Icons.check : Icons.close,
                color: check ? Colors.green : Colors.red,
              ),
              IconButton(
                  onPressed: () {
                    delete(delnum);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ))
            ],
          )
        ]),
      ),
    );
  }
}




