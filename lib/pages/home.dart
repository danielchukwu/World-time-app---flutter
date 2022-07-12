import 'package:flutter/material.dart';
import 'package:worldtime/services/World_Time.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  late String bgImage;

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    // set background image
    bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    // Set Text Color
    Color txtColor = data['isDaytime'] ? Colors.black : Colors.white;
    // print('Data Recieved: $data');

    return Scaffold(
      backgroundColor: txtColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 150.0, 0, 0),
              child: Column(
                children: [
                  TextButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(
                          context, '/choose-location');
                      setState(() {
                        data = result;
                      });
                    },
                    icon: Icon(Icons.edit_location, color: txtColor),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(letterSpacing: 2.0, color: txtColor),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ignore: Location Flag should be here
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: txtColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: txtColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
