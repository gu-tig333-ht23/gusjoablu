import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homePage.dart';

class MyState extends ChangeNotifier {
//Variables
  List<Person> _persons = [
    Person('Meditate', true),
    Person('Write a book NOW', false),
    Person('Golf', false),
    Person('test', false)
  ];

//Getters
  List<Person> get persons => _persons;

  //Functions

  void addItem(name, onChanged) {
    _persons.add(Person(name, onChanged));

    notifyListeners();
  }

  void removeItem(name, onChanged) {
    int indexToRemove = _persons.indexWhere((person) => person.name == name);

    if (indexToRemove != -1) {
      _persons.removeAt(indexToRemove);

      notifyListeners();
    }
  }

  void changeItemStatus(name, isChecked) {
    int indexToToggle = _persons.indexWhere((person) => person.name == name);

    if (indexToToggle != -1) {
      _persons[indexToToggle].isChecked = !_persons[indexToToggle].isChecked;

      notifyListeners();
    }
  }
}

//Some filter function.

void main() {
  MyState state = MyState();

  runApp(
    ChangeNotifierProvider(create: (context) => state, child: MyApp()),
  );
}

//Class build:
class Person {
  final String name;
  bool isChecked;

  Person(this.name, this.isChecked);
}
