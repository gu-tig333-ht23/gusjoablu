import 'dart:js';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/main.dart';

class MyWidget extends StatelessWidget {
  String name;
  bool isChecked;

  MyWidget(this.name, this.isChecked);

  @override
  Widget build(BuildContext context) {
    var persons = context.watch<MyState>().persons;

    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Checkbox(
                  activeColor: Color.fromARGB(255, 27, 165, 48),
                  value: isChecked,
                  onChanged: (newstatus) {
                    context.read<MyState>().changeItemStatus(name, isChecked);
                    //Anrop en funktion som set state.
                  }),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 30,
                        decoration: isChecked
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  context.read<MyState>().removeItem(name, isChecked);
                  print(name);
                },
                icon: Icon(Icons.close),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Things to do widget.

