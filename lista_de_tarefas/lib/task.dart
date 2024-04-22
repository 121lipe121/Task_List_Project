import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider/task_provider.dart';
import 'addtask.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TaskModel taskModel = Provider.of<TaskModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 20.0,
            left: 20.0,
            child: ElevatedButton(
              onPressed: () async {
                final newTask = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTaskScreen()),
                );

                if (newTask != null) {
                  taskModel.addTask(newTask); // Adiciona a nova tarefa via Provider
                }
              },
              child: Text('Adicionar Tarefa'),
            ),
          ),
          Positioned(
            top: 60.0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Para deletar tarefas, arraste-as para a direita.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 20.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: taskModel.tasks.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(taskModel.tasks[index]), 
                          onDismissed: (direction) {
                            taskModel.removeTask(index); // Remove a tarefa via Provider
                          },
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                          child: ListTile(
                            title: Text(taskModel.tasks[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
