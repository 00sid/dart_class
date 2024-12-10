void main() {
  print(Car._carInitiatiated);
  final car = Car(name: "hi");

  print(Car._carInitiatiated);
  final car1 = Car(name: "hi");

  print(Car._carInitiatiated);
}

//static is used inorder to use property of class without creating instance. We can directly access the property .

class Car {
  static int _carInitiatiated = 0;
  static int get carInitiatiated => _carInitiatiated;

  static void _increamentCarInitiatiated() => _carInitiatiated++;

  final String name;

  Car({required this.name}) {
    _increamentCarInitiatiated();
  }
}
