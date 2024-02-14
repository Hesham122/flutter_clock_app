// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class ApiData {
  final String countryName;
  final String link;
  final String flag;
  ApiData({required this.countryName, required this.flag, required this.link});
  late bool istimeday;
  late String timenow;
  late String location;
  Getdata() async {
    Response response = await get(
        Uri.parse("http://worldtimeapi.org/api/timezone/$link"));
    Map receiveData = jsonDecode(response.body);
    // print(receiveData);
    DateTime utcDate = DateTime.parse(receiveData["utc_datetime"]);
    int offset = int.parse(receiveData["utc_offset"].substring(0, 3));
    DateTime realime = utcDate.add(Duration(hours: offset));
    if (realime.hour > 5 && realime.hour < 18) {
      istimeday = true;
    } else {
      istimeday = false;
    }
    timenow = DateFormat("hh:mm a").format(realime);
    location = receiveData["timezone"];
  }
}
