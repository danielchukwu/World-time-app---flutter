import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  late String location; // name of location
  late String time; // time of location
  late String flag; // flag icon of location
  late String url; // url endpoint to get data on location
  late bool isDaytime;

  WorldTime({required this.location, required this.flag, required this.url});

  // add get time function
  Future<void> getTime() async {
    try {
      var urll = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
      var response = await http.get(urll);
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
      now = now.add(Duration(hours: offInt));

      // Set time
      time = DateFormat.jm().format(now);
      print(now.hour);
      isDaytime = (now.hour > 6 && now.hour < 18) ? true : false;

      print('..............response: ${response.body}');
      print('..............time: $time');
      print('..............isDaytime: $isDaytime');
    } catch (e) {
      time = "could not fetch data";
    }
  }
}
