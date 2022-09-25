import 'package:flutter/material.dart';
import 'package:flutter_todo/src/models/todo.dart';

class TodoItemWidget extends StatelessWidget {
  final Todo todo;
  final Animation<double> animation;
  final VoidCallback? onClicked;

  const TodoItemWidget({
    required this.todo,
    required this.animation,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override // This transition/animation can always be changed
  Widget build(BuildContext context) => SizeTransition(
        sizeFactor: animation,
        child: buildItem(),
      );

  buildItem() => Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          title: Text(
            todo.title,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          trailing: IconButton(
            onPressed: onClicked,
            icon: const Icon(Icons.delete, color: Colors.red, size: 32),
          ),
        ),
      );
}
