void main() {
//   final car = Vehicle(4);
//   print(car.toString());
  final car = Car();
  print(car.toString());
}

class Vehicle {
  final int wheelCount;
  Vehicle(this.wheelCount);

  @override
  String toString() {
    /* restricting other class to use toString() functionality
    if (runtimeType == Vehicle) {
      return "$runtimeType of wheel $wheelCount";
    } else {
      return super.toString();
    }*/
    return "$runtimeType of wheel $wheelCount";
  }
}

class Car extends Vehicle {
//   Car(super.wheelCount); // while calling constructor of car we need to pass wheelcount
//but we know actual wheelcount of car so we initialize directly
  Car() : super(4);
}
