import 'package:flutter/material.dart';
import 'main.dart';
import 'workshopPage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome(''));
  }
}

class MyHome extends StatefulWidget {
  String newTask = '';

  //Input från page2
  MyHome(this.newTask);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget item(String name, bool isChecked) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10, left: 10),
            //Checkbox fungerar ej, lyckas inte separera checkboxarna från varandra at the moment.
            child: Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState(() => isChecked = value!);
                }),
          ),
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
          Padding(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: Icon(Icons.close)),
        ],
      ),
    );
  }

// List with items
  Widget build(BuildContext context) {
    List<Person> persons = [
      Person('Meditate'),
      Person('Write a book NOW'),

      //Test input från page 2, lyckas få över datan.
      //Inte lyckats att skapa en lista där (Lägg till) knappen på page 2 .add en till person.

      Person(widget.newTask),
    ];

    return Scaffold(
      backgroundColor: Color(0xFFFFFBFC),
      appBar: AppBar(
        title: Text('Things To Do'),
        backgroundColor: Color(0xFF285238),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.more_horiz),
          ),
        ],
      ),

//Floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator page 2
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Page2()),
          );
        },
        backgroundColor: Color(0xFFE88D67),
        child: const Icon(Icons.add),
      ),
      // Listview

//Listview
      body: ListView(
        children: persons
            .map((person) => Column(
                  children: [
                    item(person.name, person.isChecked),
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
}
