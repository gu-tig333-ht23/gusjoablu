import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/todo_state.dart';
import 'list_row_widget.dart';
import 'page2.dart';

const List<String> list = <String>['All', 'Done', 'Undone'];

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //todos set as state filteradtodos's list values.
    var todos = context.watch<ToDoState>().filteredTodos;

    return Scaffold(
      backgroundColor: Color(0xFFFFFBFC),
      appBar: AppBar(
        title: Text('Things To Do'),
        backgroundColor: Color(0xFF285238),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            //Menubutton
            icon: Icon(
              Icons.menu_open_rounded,
              color: Colors.white,
            ),

            //Onselected values
            onSelected: (String value) {
              if (value == 'Undone') {
                print('Selected Value $value');
                context.read<ToDoState>().filterValues(false);
              } else if (value == 'Done') {
                print('Selected Value $value');
                context.read<ToDoState>().filterValues(true);
              } else {
                print('Selected Value $value');
                context.read<ToDoState>().filterValues(null);
              }
            },
            //Itembuilder for filtered list
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

      //Floating action button for page2 navigator.
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
                  ListRowWidget(todo.id, todo.title, todo.done),
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
