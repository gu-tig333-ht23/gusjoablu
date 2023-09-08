import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

class Person {
  final String name;

  Person(this.name);
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<Person> persons = [
      Person('Meditate'),
      Person('Write a book'),
      Person('Have fun'),
      Person('Nap'),
      Person('Tell them to bring out the whole ocean!'),
      Person('Tidy Room'),
      Person('Wash dishes'),
      Person('Study'),
      Person("Tell em' to bring out the lobster"),
      Person('Shop groceries'),
      Person("Let's go golfing"),
      Person('Walk the dog'),
      Person("Let's go to the beach")
    ];

    return Scaffold(
      //Scafffold background color
      backgroundColor: Color(0xFFFFFBFC),
      appBar: AppBar(
        title: Column(
          //Titeln är en bild hämtad från google.
          children: [
            Image.network(
              'https://www.smokymountains.org/wp-content/uploads/sites/3/2021/03/Things-to-Do-txt-img.png',
              height: 50,
              width: 200,
            ),
          ],
        ),
        backgroundColor: Color(0xFF285238),
        centerTitle: true,
        actions: [
          // Skapar de tre prickarna till höger i appbar. Lägger till padding av 10p til höger om icon.
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.more_horiz),
          ),
        ],
      ),
      // Floating button orange.
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFFE88D67),
        child: const Icon(Icons.add),
      ),
      // Listview
      body: ListView(
        children: persons
            .map((person) => Column(
                  children: [
                    _item(person.name),
                    Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                    ),
                  ],
                ))
            .toList(),
      ),
    );
  }

  Widget _item(String name) {
    // Skapar utrymme för varje row (top och bottom).
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Padding höger och vänster om icon checkbox.
          Padding(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: Icon(
              Icons.check_box_outline_blank,
              color: const Color(0xFFE88D67),
            ),
          ),
          // Expanded
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
          // Close icon till höger. Padding 10p right, left.
          Padding(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: Icon(Icons.close)),
        ],
      ),
    );
  }
}
