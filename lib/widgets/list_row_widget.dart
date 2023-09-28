import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/todo_state.dart';

// ignore: must_be_immutable
class ListRowWidget extends StatelessWidget {
  String id;
  String title;
  bool done;

  ListRowWidget(this.id, this.title, this.done);

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
                    //passing id to putTodo in data.dart
                    context.read<ToDoState>().putTodo(id);
                  }),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
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
                  context.read<ToDoState>().removeTodo(id);
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
