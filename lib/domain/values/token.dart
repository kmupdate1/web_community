class IdToken {
  final String token;
  // final DateTime expiresAt;

  // bool get isExpired => DateTime.now().isAfter(expiresAt);

  @override
  String toString() => token;

  IdToken(this.token) {
    if (token.isEmpty) throw ArgumentError("Token cannot be empty");
  }
}
