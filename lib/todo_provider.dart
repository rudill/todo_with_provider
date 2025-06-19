import 'package:flutter/material.dart';
import 'package:todo_with_provider/todo.dart';

class TodoProvider with ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addNewTodo(String title) {
    final newTodo = Todo(id: DateTime.now().toString(), title: title);
    _todos.add(newTodo);
    notifyListeners();
  }

  void toggleTodo(String id) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index].toggleDone();
      notifyListeners();
    }
  }

  void removeTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}
