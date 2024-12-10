//prototype is used when we have to make clone of instance of class in easy way
class Person {
  final String name;
  final int age;
  final String description;

  const Person({
    required this.name,
    required this.age,
    required this.description,
  });
  Person copyWith({String? name, int? age, String? description}) {
    return Person(
        name: name ?? this.name,
        age: age ?? this.age,
        description: description ?? this.description);
  }

  Person clone() => Person(name: name, age: age, description: description);
  @override
  String toString() => "$runtimeType name:$name age:$age ";
}

void main() {
  Person person1 = Person(name: "Sid", age: 20, description: "hi");
  Person person2 = person1.clone();
  print(person2.toString());
  final p3 = person2.copyWith(name: "SIddddd");
  print(p3.name);
}
