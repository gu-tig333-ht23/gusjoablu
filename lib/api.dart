import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

const String ENDPOINT = 'https://todoapp-api.apps.k8s.gu.se';
const String apiKey = 'b7d40a83-1b71-4e65-9324-53ffca2c2772';

//Take a look into the list of todos.
Future<List<ToDo>> getToDos() async {
  print('RUNNING GETTODOS');
  http.Response response =
      await http.get(Uri.parse('$ENDPOINT/todos?key=$apiKey'));

  print('Key: $apiKey');
  String body = response.body;
  print(body);

  print('http awaited...');

  Map<String, dynamic> jsonResponse = jsonDecode(body);
  List todosJson = jsonResponse['todos'];
  return todosJson.map((json) => ToDo.fromJson(json)).toList();
}

Future<void> addToDo(ToDo todo) async {
  http.Response response = await http.post(
    Uri.parse('$ENDPOINT/todos?key=$apiKey'),
    body: jsonEncode(todo.toJson()),
  );
}
