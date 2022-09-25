import 'models.dart';

/* 
    Todo: @ndrslmpk
    [ ] Add logic to increment the id after adding a new item.
 */

class Todolist {
  int id = 0;
  String title;
  String description;
  List<Todo> todos;

  Todolist({
    required this.title,
    required this.description,
    required this.todos,
  });

  Todolist.create(String title)
      : this(
          title: title,
          description: "",
          todos: List<Todo>.from([Todo.createDummy()], growable: true),
        );

  Todolist.createDummy()
      : this(
          title: "Deine Todos",
          description: "Hier werden deine Aufgaben verwaltet.",
          todos: List<Todo>.empty(growable: true),
        );

  void addDummyTodo(String title) {
    todos.add(Todo.createWithTitle(title));

    // void addTodo(Todo todo) {
    //   todos.add(todo);
    // }
  }
}
