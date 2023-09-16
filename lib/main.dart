import 'package:flutter/material.dart';
import 'homePage.dart';

void main() {
  runApp(MyApp());
}

//Class build:

class Person {
  final String name;
  final bool isChecked;

  Person(this.name, {this.isChecked = false});
}
