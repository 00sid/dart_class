//singleton using factory instead of getter and function
class Singleton3 {
  static Singleton3? _instance;
  //private constructor to limit the instances
  Singleton3._internal() {
    print("Private constructor called");
  }

  factory Singleton3() {
    _instance ??= Singleton3._internal();
    return _instance!;
  }
}

void main() {
  Singleton3 singleton1 = Singleton3();
  Singleton3 singleton2 = Singleton3();
  Singleton3 singleton3 = Singleton3();
}
