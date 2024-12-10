void main() {
  //first part
  /* 
  final person = Person(firstName: "SId", lastName: "lastname");
  print(getFullName(person));
  
  */

  //2nd part
  /*
  final cat = Cat(age: 30);
  print(cat.toString());
  cat.incrementAge();
  print(cat.toString());
  
   */

  //3rd part and imp part
  final cats = <Cat>{
    Cat(age: 2, name: "kitty1"),
    Cat(age: 3, name: "kitty2"),
    Cat(age: 2, name: "kitty1"),
  };
  print(cats);
}

//first part
/*
String getFullName(HasFullName obj) => obj.fullName;

mixin HasLastName {
  String get lastName;
}

mixin HasFirstName {
  String get firstName;
}

mixin HasFullName on HasFirstName, HasLastName {
  String get fullName => "$firstName $lastName";
}

class Person with HasFirstName, HasLastName, HasFullName {
  @override
  // TODO: implement firstName
  final String firstName;

  @override
  // TODO: implement lastName
  final String lastName;

  Person({
    required this.firstName,
    required this.lastName,
  });
}
*/

//2nd part

/*

mixin HasAge {
  abstract int age;
  void incrementAge() => age++;
}

class Cat with HasAge {
  @override
  int age;

  Cat({required this.age});
  @override
  String toString() => "$runtimeType has age:$age";
}
 */

enum PetType { dog, cat }

mixin Pet {
  int get age;
  PetType get type;
  String get name;

  @override
  String toString() => "Pet($type) name($name) age($age)";

  @override
  // TODO: implement hashCode
  int get hashCode => Object.hash(
        name,
        age,
        type,
      );

//help to remove same duplicate object like if obj cat1 and cat2 have same parameter like age 2 and name kitty then one is removed
  @override
  bool operator ==(Object other) =>
      other is Pet &&
      other.name == name &&
      other.age == age &&
      other.type == type;
}

class Cat with Pet {
  @override
  // TODO: implement age
  final int age;

  @override
  // TODO: implement name
  final String name;

  @override
  // TODO: implement type
  final PetType type;

  Cat({
    required this.age,
    required this.name,
  }) : type = PetType.cat;
}
