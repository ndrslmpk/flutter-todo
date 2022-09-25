import 'package:flutter/material.dart';
import 'package:flutter_todo/src/components/todo_item_widget.dart';
import 'package:flutter_todo/src/models/todolist.dart';

class TodoForm extends StatelessWidget {
  final todoListKey = GlobalKey<AnimatedListState>();
  // final Todolist todoList;
  TodoForm({super.key, required this.todoList});
  final Todolist todoList;
  // TodoForm({super.key});

  // @override
  // State<StatefulWidget> createState() {
  //   return _TodoFormState();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'What do you want to do next?',
                ),
                onSubmitted: (String description) {
                  // todoListKey.currentState.todoList.addDummyTodo(description);
                  todoList.addDummyTodo(description);
                },
              )),
          // ignore: avoid_unnecessary_containers
          Expanded(
            child: AnimatedList(
                key: todoListKey,
                initialItemCount: todoList.todos.length,
                itemBuilder: (context, index, animation) => TodoItemWidget(
                    todo: todoList.todos[index],
                    animation: animation,
                    onClicked: () => removeItem(index))),
          ),
        ]);
  }

  void removeItem(int index) {
    final removedTodo = todoList.todos[index];

    todoList.todos.removeAt(index);
    todoListKey.currentState!.removeItem(
        index,
        (context, animation) => TodoItemWidget(
            todo: removedTodo,
            animation: animation,
            onClicked: () => showAlert(context)),
        duration: const Duration(milliseconds: 300));
  }

  void showAlert(BuildContext context) {
    () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('AlertDialog Title'),
            content: const Text('AlertDialog description'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
  }
}

// class _TodoFormState extends State<TodoForm> {

//   }
// }
