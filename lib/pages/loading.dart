import 'package:flutter/material.dart';
import 'package:learn_flutter/models/location.dart';
import 'package:learn_flutter/models/main_route.dart';
import 'package:learn_flutter/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getInitialData() async {
    WorldTime worldTime = WorldTime(location: const Location(city: "Jakarta", continent: "Asia"), flag: "assets/Jakarta.png");
    await worldTime.getTime();

    if(context.mounted){
      Navigator.pushReplacementNamed(context, "/home", arguments: MainRoute(
        location: worldTime.location, 
        time: worldTime.time, 
        flag: worldTime.flag,
        isDaytime: worldTime.isDaytime
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    getInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      body: const SafeArea(
          child: Center(
            child: SpinKitRotatingCircle(
            color: Colors.white,
            size: 50.0,
          )
        ),
      ),
    );
  }
}