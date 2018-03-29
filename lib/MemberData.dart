class MemberData {
  final String name;

  MemberData(this.name) {
    if (name == null) {
      throw new ArgumentError("login of Member cannot be null. "
          "Received: '$name'");
    }
  }
}