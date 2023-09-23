import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

const String ENDPOINT = 'https://todoapp-api.apps.k8s.gu.se';
const String apiKey = 'b7d40a83-1b71-4e65-9324-53ffca2c2772';

//Take a look into the list of todos.
Future<List<ToDo>> getToDos() async {
  print('Making request to api:');
  http.Response response =
      await http.get(Uri.parse('$ENDPOINT/todos?key=$apiKey'));
  String body = response.body;

  print(body);

  List<dynamic> jsonResponse = jsonDecode(body);
  List<ToDo> todosJson =
      jsonResponse.map((json) => ToDo.fromJson(json)).toList();

  return todosJson;
}

Future<void> addToDo(todo) async {
  http.Response response = await http.post(
    Uri.parse('$ENDPOINT/todos?key=$apiKey'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(todo.toJson()),
  );
}

Future<void> removeToDo(String id) async {
  http.Response response = await http.delete(
    Uri.parse('$ENDPOINT/todos/$id?key=$apiKey'), // Updated URL
  );
}
