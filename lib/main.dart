import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/data.dart';
import 'widgets/homePage.dart';

void main() {
  MyState state = MyState();

  print('----Running fetchNotes in MyState------');
  state.fetchTodos();

  runApp(
    ChangeNotifierProvider(create: (context) => state, child: MyApp()),
  );
}
