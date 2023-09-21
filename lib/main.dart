import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/data.dart';
import 'widgets/homePage.dart';

void main() {
  MyState state = MyState();

  print('RUNNING STATE.FETCH()');

  runApp(
    ChangeNotifierProvider(create: (context) => state, child: MyApp()),
  );
}
