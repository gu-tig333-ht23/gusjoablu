import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/data.dart';
import 'workshopPage.dart';
import 'listwidget.dart';

// NOTE IMPORT API

const List<String> list = <String>['All', 'Done', 'Undone'];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var todos = context.watch<MyState>().filteredTodos;

    return Scaffold(
      backgroundColor: Color(0xFFFFFBFC),
      appBar: AppBar(
        title: Text('Things To Do'),
        backgroundColor: Color(0xFF285238),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            icon: Icon(
              Icons.menu_open_rounded,
              color: Colors.white,
            ),
            onSelected: (String value) {
              if (value == 'Undone') {
                print('Selected Value $value');
                context.read<MyState>().filterValues(false);
              } else if (value == 'Done') {
                print('Selected Value $value');
                context.read<MyState>().filterValues(true);
              } else {
                print('Selected Value $value');
                context.read<MyState>().filterValues(null);
              }
            },
            itemBuilder: (BuildContext context) {
              return list.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),

      // Floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator page 2
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

      // Listview
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
