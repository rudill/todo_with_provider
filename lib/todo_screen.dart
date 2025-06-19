import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_provider/todo_provider.dart';

class TodoScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    final todos = todoProvider.todos;

    return Scaffold(
      appBar: AppBar(title: Text('ToDo with Provider')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: 'Enter new task'),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (_controller.text.trim().isNotEmpty) {
                      todoProvider.addNewTodo(_controller.text.trim());
                      _controller.clear();
                    }
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (_, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration:
                          todo.isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                    ),
                  ),
                  subtitle: Text(todo.id),
                  leading: Checkbox(
                    value: todo.isDone,
                    onChanged: (_) {
                      todoProvider.toggleTodo(todo.id);
                    },
                  ),
                  trailing: IconButton(
                    onPressed: () => todoProvider.removeTodo(todo.id),
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
