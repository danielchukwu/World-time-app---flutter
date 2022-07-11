import 'package:flutter/material.dart';
import 'package:worldtime/services/World_Time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading...";
  String location = "Berlin";

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: "berlin_flag", url: "Europe/Berlin");
    await instance.getTime();
    print(instance.time);

    // set time
    setState(() {
      time = instance.time.toString();
    });
  }

  @override
  void initState() {
    super.initState();

    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    print(time);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(location),
            Text(time),
          ],
        ),
      ),
    );
  }
}
