import 'package:flutter/foundation.dart';

class TaskModel extends ChangeNotifier {
  List<String> tasks = [];

  void addTask(String newTask) {
    tasks.add(newTask);
    notifyListeners();
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}