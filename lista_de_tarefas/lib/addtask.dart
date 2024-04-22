import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider/task_provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController taskController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Tarefa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: taskController,
                decoration: InputDecoration(
                  hintText: 'Digite a tarefa...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String newTask = taskController.text.trim();
                if (newTask.isNotEmpty) {
                  Provider.of<TaskModel>(context, listen: false).addTask(newTask);
                  Navigator.pop(context); // Fecha a tela de adicionar tarefa
                }
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
