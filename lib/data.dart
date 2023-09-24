import 'package:flutter/material.dart';
import 'package:template/api.dart' as api;
import 'model.dart';

class MyState extends ChangeNotifier {
  List<ToDo> _todos = [];
  bool? _filterDone;

  List<ToDo> get todos => _todos;
  List<ToDo> get filteredTodos {
    if (_filterDone == null) {
      return _todos;
    } else {
      return _todos.where((todo) => todo.done == _filterDone).toList();
    }
  }

  void fetchTodos() async {
    var todos = await api.getToDos();
    _todos = todos;
    int _len = todos.length;
    print('Api item lenght: $_len');
    notifyListeners();
  }

  //AddItem (toDo)
  void addTodo(todo) async {
    await api.addTodo(todo);
    fetchTodos();
  }

  void removeTodo(String id) async {
    int indexToRemove = _todos.indexWhere((todo) => todo.id == id);

    if (indexToRemove != -1) {
      await api.removeTodo(id);
      _todos.removeAt(indexToRemove);

      print('Removed....');
      fetchTodos();
    }
  }

  void putTodo(String id) async {
    int indexToToggle = _todos.indexWhere((todo) => todo.id == id);

    if (indexToToggle != -1) {
      // Toggle the 'done' value
      _todos[indexToToggle].done = !_todos[indexToToggle].done;

      print('ID Found: bool value changed....');
      print(_todos[indexToToggle].toJson()); // Print the updated todo
      await api
          .putTodo(_todos[indexToToggle]); // Send the updated todo to the API

      fetchTodos();
    }
  }

  void filterValues(bool? filterDone) {
    print('filterValue entered value: $filterDone');
    _filterDone = filterDone;
    notifyListeners();
  }
}
