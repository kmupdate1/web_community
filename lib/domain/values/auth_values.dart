class Username {
  final String value;

  @override
  String toString() => value;

  Username(this.value) {
    if (value.isEmpty) throw ArgumentError("Username is required");
  }
}

class Email {
    final String value;

  @override
  String toString() => value;

  Email(this.value) {
    if (value.isEmpty) throw ArgumentError("Email is required");
  }

}

class Password {
    final String value;

  @override
  String toString() => value;

  Password(this.value) {
    if (value.isEmpty) throw ArgumentError("Password is required");
  }
}
