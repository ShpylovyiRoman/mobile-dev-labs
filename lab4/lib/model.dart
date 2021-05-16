import 'package:flutter/material.dart';

class Task {
  String name;
  bool selected;

  Task(this.name, this.selected);
}

class TasksProvider extends ChangeNotifier {
  List<Task> _tasks = [
    Task("Homework", false),
    Task("Play football", false),
    Task("Clean window", false),
    Task("Go to the shop", false),
    Task("Drope table", false),
    Task("Call my mum", false)
  ];

  void selectTask(Task task, bool selected) {
    _tasks.firstWhere((element) => element.name == task.name).selected =
        selected;
    notifyListeners();
  }

  void len() => print(_tasks.length);

void drop() {
  for (var i = 0; i < _tasks.length; i++) {
  selectTask(_tasks[i], false);
  }
  notifyListeners();
}

  List<Task> get selectedTasks =>
      _tasks.where((element) => element.selected).toList();

  List<Task> get task => _tasks;
}
