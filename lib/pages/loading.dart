import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:worldtime/services/World_Time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() async {
    super.initState();

    WorldTime instance = WorldTime(
        location: 'Berlin', flag: "berlin_flag", url: "Europe/Berlin");
    await instance.getTime();
    print(instance.time);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Loading Screen 🔃'),
    );
  }
}
