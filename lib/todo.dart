class Todo {
  final String title;
  final String id;
  bool isDone;

  Todo({required this.id, required this.title, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
