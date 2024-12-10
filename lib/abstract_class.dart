import 'package:class_lesson/main.dart';
import 'package:flutter/material.dart';

enum Type { cat, dog }

abstract class CanRun {
  final Type type;
  const CanRun({
    required this.type,
  });

  // //abstract provides the method to be used by sub classes
  // String get type {
  //   if (this is Cat) {
  //     return "cat";
  //   } else {
  //     return "Something else";
  //   }
  // }

  @mustCallSuper
  void run() {
    "CanRun's run function called".log();
  } //it is abstract method without any logic and if logic is added in it then it is not an abstract class
}

// abstract class CanWalk{
//   void walk;
// }
// with extends we can inherit from only one class but with can help to inherit from multiple class like with CanRun,CanWalk
@immutable
class Cat extends CanRun {
  //when run function is implemented in cat class , any logic written in run method CanRun class doesn't get executed since Cat class is overriding the method
  //so super is used in subclass to execute the method in parent class

  //implementing constructor of CanRun class
  const Cat() : super(type: Type.cat);
  @override
  void run() {
    // TODO: implement run
    super.run();
    "cat is running".log();
  }
}

class Dog extends CanRun {
  const Dog() : super(type: Type.dog);
}

void testIt() {
  "testit called".log();
  final cat = Cat();
  final dog = Dog();
  cat.type.log();
  dog.type.log();
}

class AbstractClass extends StatefulWidget {
  const AbstractClass({super.key});

  @override
  State<AbstractClass> createState() => _AbstractClassState();
}

class _AbstractClassState extends State<AbstractClass> {
  @override
  Widget build(BuildContext context) {
    testIt();
    return const Scaffold();
  }
}
