import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/data.dart';
import 'workshopPage.dart';
import 'listwidget.dart';

//NOTE IMPORT API

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  @override

// Homepage widget
  Widget build(BuildContext context) {
    var todos = context.watch<MyState>().todos;

    return Scaffold(
      backgroundColor: Color(0xFFFFFBFC),
      appBar: AppBar(
        title: Text('Things To Do'),
        backgroundColor: Color(0xFF285238),
        centerTitle: true,
        leading: IconButton(
          // Use the leading property
          onPressed: () {
            //Testar api
            context
                .read<MyState>()
                .removeToDo('f4cc4e4e-bddd-4adf-b1bc-75f2f20635f2');
          },
          icon: Icon(Icons.abc),
        ),
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
        children: todos
            .map(
              (todo) => Column(
                children: [
                  MyWidget(todo.id, todo.title, todo.done),
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
