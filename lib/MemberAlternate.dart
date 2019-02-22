class MemberDataAlternate {
  final String name;

  MemberDataAlternate(this.name) {
    if (name == null) {
      throw new ArgumentError("login of Member cannot be null. "
          "Received: '$name'");
    }
  }
}
