import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime {
  late String location;
  late String time;
  late String flag;
  late String url;

  WorldTime({required this.location, required this.flag, required this.url});

  // add get time function
  Future<void> getTime() async {
    try {
      var urll = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
      var response = await http.get(urll);
      print('..............response: ${response.body}');
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
      time = now.toString();
    } catch (e) {
      time = "could not fetch data";
    }
  }
}
