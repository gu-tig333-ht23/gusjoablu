import 'package:flutter/material.dart';
import 'package:template/api.dart' as api;
import 'model.dart';

class MyState extends ChangeNotifier {
  List<ToDo> _todos = [];

  List<ToDo> get todos => _todos;

  void fetchTodos() async {
    print('Running fetchTodos() in fetchTodo');
    var todos = await api.getToDos();
    _todos = todos;

    print(_todos.length);

    notifyListeners();
  }

  //AddItem (toDo)
  void addToDo(todo) async {
    await api.addToDo(todo);
    fetchTodos();
  }

  void removeToDo(String id) async {
    int indexToRemove = _todos.indexWhere((todo) => todo.id == id);

    if (indexToRemove != -1) {
      await api.removeToDo(id);
      _todos.removeAt(indexToRemove);
      print('Removed');
      fetchTodos();
    }
  }
}
