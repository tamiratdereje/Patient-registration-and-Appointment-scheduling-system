class Password {
  String? password;
  Password({required this.password}) {
    if (this.password!.length < 4) {
      throw Exception("Invalid Password");
    }
  }
  @override
  String toString() {
    return password!;
  }
}
