import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/todo_state.dart';
import 'widgets/homepage.dart';

void main() {
  ToDoState state = ToDoState();

  state.fetchTodos();

  runApp(
    ChangeNotifierProvider(create: (context) => state, child: MyApp()),
  );
}
