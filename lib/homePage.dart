import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'workshopPage.dart';
import 'widgets.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  //Building widget
  @override

//Build
  Widget build(BuildContext context) {
    var persons = context.watch<MyState>().persons;

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
            MaterialPageRoute(
              builder: (context) => Page2(),
            ),
          );
        },
        backgroundColor: Color(0xFFE88D67),
        child: const Icon(Icons.add),
      ),

//Listview
      body: ListView(
        children: persons
            .map(
              (person) => Column(
                children: [
                  MyWidget(person.name, person.isChecked),
                  Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
