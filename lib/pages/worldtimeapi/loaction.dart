import 'package:flutter/material.dart';
import 'package:flutter_clock_app/pages/worldtimeapi/classapi.dart';

import '../../bottomappbar.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<ApiData> allcountry = [
    ApiData(link: "Africa/Cairo", countryName: "Egypt/cairo", flag: "OIP.jpeg"),
    ApiData(
        link: "Africa/Casablanca",
        countryName: "Morocco/Casablanca",
        flag: "download (1).jpeg"),
    ApiData(
        link: "Asia/Riyadh",
        countryName: "Saudi Arabia/Riyadh",
        flag: "download (5).jpeg"),
    ApiData(
        link: "Africa/Tunis",
        countryName: "Tunisia/Tunis ",
        flag: "download (2).jpeg"),
    ApiData(
        link: "Africa/Algiers",
        countryName: "Algeria/Algiers",
        flag: "download.jpeg"),
    ApiData(
        link: "America/Toronto",
        countryName: "Canada/Toronto",
        flag: "download (3) .jpeg"),
    ApiData(
        link: "Australia/Sydney",
        countryName: "Australia/Sydney",
        flag: "download (4).jpeg"),
    ApiData(link: "Asia/Gaza", countryName: "Palestine/Gaza", flag: "R.jpeg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Select Country"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: allcountry.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11)),
                // margin: EdgeInsets.all(7),
                child: ListTile(
                  onTap: () {
                    ApiData clickedcountry = allcountry[index];
                    clickedcountry.Getdata();
                    Navigator.pop(context, {
                      "timeNow": clickedcountry.timenow,
                      "location": clickedcountry.location,
                      "istimeday": clickedcountry.istimeday
                    });
                  },
                  title: Text(
                    allcountry[index].countryName,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/${allcountry[index].flag}"),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/timenow");
        },
        child: const Icon(Icons.access_time_sharp),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const Bottomappbar(),
    );
  }
}
