import 'package:flutter/material.dart';
import 'package:flutter_clock_app/bottomappbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data =
        data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;
    String bgimg = data["istimeday"] ? "morning.jpg" : "night.jpg";
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "World time",
          style: TextStyle(fontSize: 27),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/$bgimg"), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  dynamic resalt =
                      await Navigator.pushNamed(context, "/location");
                  setState(() {
                    if (resalt == null) {
                      data = {
                        "timeNow": "No time",
                        "location": "No location",
                        "istimeday": false
                      };
                    } else {
                      data = {
                        "timeNow": resalt["timeNow"],
                        "location": resalt["location"],
                        "istimeday": resalt["istimeday"]
                      };
                    }
                  });
                },
                icon: const Icon(Icons.location_on_sharp),
                label: const Text(
                  "Edit Loaction",
                  style: TextStyle(fontSize: 25),
                ),
                style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(EdgeInsets.all(12)),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.deepPurple),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11)))),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                color: const Color.fromARGB(166, 0, 0, 0),
                child: Column(
                  children: [
                    Text(
                      data["timeNow"],
                      style: const TextStyle(fontSize: 55, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Text(
                      data["location"],
                      style: const TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/timenow");
        },
        child: Icon(Icons.access_time_sharp),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const Bottomappbar(),
    );
  }
}
