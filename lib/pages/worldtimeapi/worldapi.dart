import 'package:flutter/material.dart';
import 'package:flutter_clock_app/bottomappbar.dart';
import 'package:flutter_clock_app/pages/worldtimeapi/classapi.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  GetDatafromApi() async {
    ApiData onecountry =
        ApiData(countryName: "Egypt", flag: "OIP.jpeg", link: "Africa/Cairo");
    await onecountry.Getdata();

    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "timeNow": onecountry.timenow,
      "location": onecountry.location,
      "istimeday": onecountry.istimeday,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetDatafromApi();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCircle(
              color: Colors.grey,
              size: 160.0,
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              "Loading",
              style: TextStyle(fontSize: 33),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Bottomappbar(),
    );
  }
}
