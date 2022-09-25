import 'models.dart';

class Todo {
  int id;
  User user;
  String title;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  bool done;

  Todo(
      {this.id = 0,
      required this.user,
      required this.title,
      required this.description,
      required this.createdAt,
      required this.updatedAt,
      this.done = false});

  Todo.createWithTitle(String title)
      : this(
          user: User(0, "Andi"),
          title: title,
          description: "",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          done: false,
        );

  Todo.createDummy()
      : this(
          user: User(0, "TestUser"),
          title: "DummyTitle",
          description: "DummyDescription",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
}
