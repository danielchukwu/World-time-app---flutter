import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    var url = Uri.parse('https://worldtimeapi.org/api/timezone/Europe/London');
    var response = await http.get(url);
    Map data = jsonDecode(response.body);

    // get datetime and offset
    String datetime = data['datetime'];
    String offset = data['utc_offset'];

    // create DateTime object
    DateTime now = DateTime.parse(datetime);

    // grab offset first 3 values e.g +01:00 --> 01    or -01:00 --> -01
    int offInt;

    if (offset[0] == "+") {
      offInt = int.parse(offset.substring(1, 3));
    } else {
      offInt = int.parse(offset.substring(0, 3));
    }
    print("off_int: $offInt");

    print('old DateTime: $now');
    now = now.add(Duration(hours: offInt));
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Loading Screen 🔃'),
    );
  }
}
