import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/data.dart';

// ignore: must_be_immutable
class MyWidget extends StatelessWidget {
  String id;
  String toDo_title;
  bool done;

  MyWidget(this.id, this.toDo_title, this.done);

  @override
  Widget build(BuildContext context) {
    id = id;
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
                  value: done,
                  onChanged: (notDone) {
                    //context.read<MyState>().changeItemStatus(toDo_title, done);
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
                    toDo_title,
                    style: TextStyle(
                        fontSize: 30,
                        decoration: done
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
                  context.read<MyState>().removeToDo(id);
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
