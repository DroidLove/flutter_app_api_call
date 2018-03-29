class Member {
  final String employee;

  Member(this.employee) {
    if (employee == null) {
      throw new ArgumentError("login of Member cannot be null. "
          "Received: '$employee'");
    }
  }
}