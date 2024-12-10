enum Role { mom, son, dad }

void main() {
  final mom = Mom();
  print(mom.role);
}

class Person {
  final Role role;
  const Person({
    required this.role,
  });
}

class Mom extends Person {
  const Mom() : super(role: Role.mom);
}

class Dad extends Person {
  const Dad() : super(role: Role.dad);
}
