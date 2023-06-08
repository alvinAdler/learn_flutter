import 'package:flutter/material.dart';
import 'package:learn_flutter/models/location.dart';
import 'package:learn_flutter/models/main_route.dart';
import 'package:learn_flutter/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: const Location(city: 'London', continent: "Europe"), flag: 'uk.png'),
    WorldTime(location: const Location(city: 'Athens', continent: "Europe"), flag: 'greece.png'),
    WorldTime(location: const Location(city: 'Cairo', continent: "Africa"), flag: 'egypt.png'),
    WorldTime(location: const Location(city: 'Nairobi', continent: "Africa"), flag: 'kenya.png'),
    WorldTime(location: const Location(city: 'Chicago', continent: "America"), flag: 'usa.png'),
    WorldTime(location: const Location(city: 'New_York', continent: "America"), flag: 'usa.png'),
    WorldTime(location: const Location(city: 'Seoul', continent: "Asia"), flag: 'south_korea.png'),
    WorldTime(location: const Location(city: 'Jakarta', continent: "Asia"), flag: 'indonesia.png'),
  ];

  void getData(int index) async{
    WorldTime dateTime = locations[index];
    await dateTime.getTime();

    if(context.mounted){
      Navigator.pop(context, MainRoute(
        location: dateTime.location, 
        time: dateTime.time, 
        flag: dateTime.flag, 
        isDaytime: dateTime.isDaytime
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Choose Location")),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          final WorldTime currentItem = locations[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: (
                ListTile(
                  onTap: () => getData(index),
                  leading: CircleAvatar(backgroundImage: AssetImage("assets/${currentItem.flag}")),
                  title: Text(currentItem.location.city),
                )
              ),
            ),
          );
        },
      )
    );
  }
}