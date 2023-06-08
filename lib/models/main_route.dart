import 'package:learn_flutter/models/location.dart';

class MainRoute{
  final Location location;
  final String time;
  final String flag;
  final bool isDaytime;

  const MainRoute({required this.location, required this.time, required this.flag, required this.isDaytime});
}