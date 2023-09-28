import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/todo_state.dart';
import 'widgets/page1.dart';

void main() {
  //State
  ToDoState state = ToDoState();

  state.fetchTodos();

  runApp(
    ChangeNotifierProvider(create: (context) => state, child: MyApp()),
  );
}

//MyApp builds materialapp and set home as page1().
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Page1());
  }
}
