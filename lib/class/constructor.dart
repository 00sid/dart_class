void main() {
  final person = Person(name: "Sid", age: 10);
  print(person.name);
  print(person.age);
  final ram = Person.ram();
  print(ram.name);
  print(ram.age);
  final optional = Person.optional(40);
  print(optional.name);
  print(optional.age);
}

class Person {
  final String name;
  final int age;

  //named or normal constructor
  const Person({required this.name, required this.age});
  //default constructor or fixed
  Person.ram()
      : name = "ram",
        age = 30;

  //passing one value and other making default

  Person.optional(this.age) : name = "Optional";

  //making both parameter optional

  Person.other({String? name, int? age})
      : name = name ?? "Other name",
        age = age ?? 60;
}
