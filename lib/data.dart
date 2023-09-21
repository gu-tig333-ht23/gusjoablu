import 'package:flutter/material.dart';
import 'model.dart';
import 'api.dart';

class MyState extends ChangeNotifier {
  List<ToDo> _todos = [];

  List<ToDo> get todos => _todos;

  void fetchTodos() async {
    print('RUNNING FETCHTODOS');
    var _todos = await getToDos();

    notifyListeners();
  }

  //AddItem (toDo)
  void addItem(id, title, done) {
    _todos.add(ToDo(
      id,
      title,
      done,
    ));

    notifyListeners();
  }

  //RemoveItem (toDo)
  void removeItem(title, done) {
    int indexToRemove = _todos.indexWhere((ToDo) => ToDo.title == ToDo.title);

    if (indexToRemove != -1) {
      _todos.removeAt(indexToRemove);

      notifyListeners();
    }
  }

//ChangeItemStatus (of toDO.done)
  void changeItemStatus(title, done) {
    int indexToToggle = _todos.indexWhere((ToDo) => ToDo.title == ToDo.title);

    if (indexToToggle != -1) {
      _todos[indexToToggle].done = !_todos[indexToToggle].done;

      notifyListeners();
    }
  }
}
