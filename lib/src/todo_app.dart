import 'package:flutter/material.dart';
// import 'package:flutter_todo/src/components/todo_search_delegate.dart';
import 'package:flutter_todo/src/models/models.dart';
import 'package:flutter_todo/src/pages/todo_form.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<StatefulWidget> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  Todolist todoList = Todolist.create("Todolist");
  final todoListListKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Hi, Rebecca.'),
            // actions: [
            //   IconButton(
            //       icon: const Icon(Icons.search),
            //       color: Colors.blue.shade900,
            //       onPressed: () {
            //         showSearch(
            //           context: context,
            //           delegate: TodoSearchDelegate(),
            //         );
            //       }),
            // ],
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: TodoForm(todoList: todoList),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                todoList.addDummyTodo("New One");
              });
            },
          ),
        ),
      ),
    );
  }
}
