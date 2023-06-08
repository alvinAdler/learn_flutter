import 'package:http/http.dart';
import 'dart:convert';
import 'package:learn_flutter/models/location.dart';
import 'package:intl/intl.dart';

class WorldTime{
  final Location location;
  String time = "";
  String url = "";
  final String flag;
  bool isDaytime = false;

  WorldTime({required this.location, required this.flag}){
    url = "${location.continent}/${location.city}";
  }

  Future getTime() async{
    try {
      Response res = await get(Uri.parse("https://timeapi.io/api/Time/current/zone?timeZone=$url"));
      Map data = jsonDecode(res.body);
      
      DateTime dateTime = DateTime.parse(data["dateTime"]);
      time = DateFormat.jm().format(dateTime);
      isDaytime = dateTime.hour > 6 && dateTime.hour < 18;
    } catch (e) {
      print("Error while fetching timezone. Message: $e");
      time = "Failed to get time";
    }
  }
}