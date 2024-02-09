import 'package:api_connection/config/api/api_setting.dart';
import 'package:api_connection/data/models/todo_response_model.dart';
import 'package:dio/dio.dart';

class TodoRepository {
  Api api = Api();

  Future<List<TodoModel>> fetchTodos() async {
    try {
      Response response = await api.getdio.get('/todos');
      List<dynamic> todo = response.data;

      return todo.map((todoItem) => TodoModel.fromJson(todoItem)).toList();
    } catch (e) {
      throw e;
    }
  }
}
