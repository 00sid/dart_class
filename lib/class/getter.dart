void main() {
  final sid = Person(
    firstName: "Siddhartha",
    lastName: "Basnet",
  );
  print(sid.fullName);
}

// class Person {
//   final String firstName;
//   final String lastName;
//   final String fullName;

//   // Person({
//   //   required this.firstName,
//   //   required this.lastName,
//   // }) : fullName = "$firstName $lastName";
// }

class Person {
  final String firstName;
  final String lastName;

  const Person({required this.firstName, required this.lastName});
  String get fullName => "$firstName $lastName";
}
