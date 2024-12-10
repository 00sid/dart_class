void main() {
  print(Vehicle.car());
}

//factory is used to create instance of subclass
class Vehicle {
  const Vehicle();

  factory Vehicle.car() => const Car();
  factory Vehicle.truck() => const Truck();
  String toString() {
    return "Vehicle of type $runtimeType";
  }
}

class Car extends Vehicle {
  const Car();
}

class Truck extends Vehicle {
  const Truck();
}
