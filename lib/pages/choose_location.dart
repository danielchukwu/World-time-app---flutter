import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    // print("build just fired!");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a Location'),
        backgroundColor: Colors.black87,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  counter += 1;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.red)),
                ),
              ),
              child: Text('Counter is $counter'),
            ),
          )
        ],
      ),
    );
  }
}
