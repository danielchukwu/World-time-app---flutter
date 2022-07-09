import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/choose-location');
            },
            icon: const Icon(Icons.edit_location),
            label: const Text('Edit Location'),
          )
        ],
      ),
    );
  }
}
