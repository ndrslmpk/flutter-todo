class User {
  final num id;
  final String name;
  // Add avatar

  User(this.id, this.name);

  User getDefaultUser() {
    return User(id, name);
  }
}
