import 'package:flutter/material.dart';
import 'package:worldtime/pages/choose_location.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    title: 'World Time App',
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/choose-location': (context) => const ChooseLocation(),
    },
  ));
}
