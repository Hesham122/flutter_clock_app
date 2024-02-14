import 'package:flutter/material.dart';
import 'package:flutter_clock_app/bottomappbar.dart';
import 'package:flutter_clock_app/constant/colors.dart';
import 'package:flutter_clock_app/pages/Todo/counter.dart';
import 'package:flutter_clock_app/pages/Todo/todocard.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class Tasks {
  String title;
  bool status;
  Tasks({required this.status, required this.title});
}

List alltask = [
  Tasks(status: false, title: "Hesham is the best flutter Dev 😎"),

];

class _TodoState extends State<Todo> {
  final mycontroller = TextEditingController();
  
  addtask() {
    setState(() {
      
      alltask.add(Tasks(status: false, title: mycontroller.text));
    });
  }

  changestatus(int x) {
    setState(() {
      alltask[x].status = !alltask[x].status;
    });
  }

  deletetask(int value) {
    setState(() {
      alltask.remove(alltask[value]);
    });
  }

  int CountTrue() {
    int count = 0;
    alltask.forEach((element) {
      if (element.status) {
        count++;
      }
    });
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: main_appbar_color,
        title: Text(
          "To Do App",
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Counter(countt: CountTrue(), alltsk: alltask.length),
              Container(
                height: 600,
                child: ListView.builder(
                    itemCount: alltask.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TodoCard(
                        check: alltask[index].status,
                        text: alltask[index].title,
                        myfunc: changestatus,
                        numfunc: index,
                        delete: deletetask,
                        delnum: index,
                        
                      );
                    }),
              )
            ],
          ),
          Positioned(
            bottom: 22,
            right: 17,
              child: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        height: 200,
                        width: 250,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 22,
                            ),
                            TextField(
                              controller: mycontroller,
                              maxLength: 30,
                              decoration: InputDecoration(
                                  labelText: "New Tasks",
                                  labelStyle: TextStyle(fontSize: 19)),
                            ),
                            TextButton(
                                onPressed: () {
                                  addtask();
                                  Navigator.pop(context);
                                },
                                child: Text("ADD",
                                    style: TextStyle(fontSize: 25))),
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Icon(Icons.add),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, "/timenow");
      },
    child: Icon(Icons.access_time_sharp),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Bottomappbar()

  );
  }
}
