class Car {
  int _speed = 0;
  int get speed => _speed;
  //setting value of _speed with the help of setter
  set speed(int newSpeed) {
    if (newSpeed < 0) {
      throw Exception('speed cannot be negative');
    } else {
      _speed = newSpeed;
    }
  }

  void drive({required int speed}) {
    //this.speed is set speed function
    this.speed = speed;
    print("Accelerating to $speed");
  }

  void stop() {
    speed = 0;
    print("stopping");
  }
}

void main() {
  final car = Car();
  try {
    car.drive(speed: 10);
    car.drive(speed: -1);
  } catch (e) {
    print(e);
  }
}
