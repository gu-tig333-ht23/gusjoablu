import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

const String ENDPOINT = 'https://todoapp-api.apps.k8s.gu.se';
const String apiKey = 'b7d40a83-1b71-4e65-9324-53ffca2c2772';

Future<List<ToDo>> getToDos() async {
  http.Response response =
      await http.get(Uri.parse('$ENDPOINT/todos?key=$apiKey'));
  String body = response.body;

  List<dynamic> jsonResponse = jsonDecode(body);
  List<ToDo> todosJson =
      jsonResponse.map((json) => ToDo.fromJson(json)).toList();

  return todosJson;
}

//remove unused variables for clean code.
Future<void> addTodo(todo) async {
  await http.post(
    Uri.parse('$ENDPOINT/todos?key=$apiKey'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(todo.toJson()),
  );
}

Future<void> removeTodo(String id) async {
  await http.delete(
    Uri.parse('$ENDPOINT/todos/$id?key=$apiKey'),
  );
}

Future<void> putTodo(ToDo todo) async {
  String id = todo.id;
  await http.put(Uri.parse('$ENDPOINT/todos/$id?key=$apiKey'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(todo.toJson()));
}
