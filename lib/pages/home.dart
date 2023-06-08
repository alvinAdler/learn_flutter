import 'package:flutter/material.dart';
import 'package:learn_flutter/models/main_route.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  MainRoute? currentData;

  @override
  Widget build(BuildContext context) {

    currentData = (currentData != null && currentData?.time != "") ? currentData : ModalRoute.of(context)!.settings.arguments as MainRoute;

    final String backgroundImage = currentData!.isDaytime ? "day.png" : "night.png";
    final Color scaffoldBackgroundColor = currentData!.isDaytime ? Colors.blue : Colors.indigo.shade700;

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: SafeArea(child: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/$backgroundImage"), fit: BoxFit.cover)),
        width: double.infinity,
        padding: const EdgeInsets.only(bottom: 50),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton.icon(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, "/location");

                  if(result != null){
                    setState(() {
                      currentData = MainRoute(location: result.location, time: result.time, flag: result.flag, isDaytime: result.isDaytime);
                    });
                  }
                }, 
                icon: const Icon(Icons.edit_location, color: Colors.grey,), 
                label: const Text("Edit Location", style: TextStyle(color: Colors.white70),),
              ),
              const SizedBox(height: 20,),
              Text(currentData?.location.city ?? "", style: const TextStyle(
                color: Colors.white70,
                fontSize: 28,
                letterSpacing: 2
              ),),
              const SizedBox(height: 30,),
              Text(currentData?.time ?? "", style: const TextStyle(
                fontSize: 55,
                color: Colors.white70
              ),)
            ],
          ),
        ),
      )),
    );
  }
}