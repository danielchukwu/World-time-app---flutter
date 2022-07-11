import 'package:flutter/material.dart';
import 'package:worldtime/services/World_Time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading...";

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Estonia', flag: "berlin_flag", url: "Europe/Berlin");
    await instance.getTime();
    // print(instance.time);

    if (instance.time == 'could not fetch data') {
      // Do not redirect home
      setState(() {
        time = instance.time.toString();
      });
    } else {
      // Redirect home with data
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'time': instance.time,
        'flag': instance.flag,
      });
    }
  }

  @override
  void initState() {
    super.initState();

    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(time),
          ],
        ),
      ),
    );
  }
}
