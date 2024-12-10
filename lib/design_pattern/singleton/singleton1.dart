//singleton is used to create the instance of class only one time
class Singleton1 {
  static Singleton1? _instance;
  //private constructor to limit the instances
  Singleton1._internal() {
    print("Private constructor called");
  }

  static Singleton1 getInstance() {
    _instance ??= Singleton1._internal();
    return _instance!;
  }
}

void main() {
  Singleton1 singleton1 = Singleton1.getInstance();
  Singleton1 singleton2 = Singleton1.getInstance();
  Singleton1 singleton3 = Singleton1.getInstance();
}
