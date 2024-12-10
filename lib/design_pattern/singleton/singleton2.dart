//singleton using getter function
class Singleton2 {
  static Singleton2? _instance;
  //private constructor to limit the instances
  Singleton2._internal() {
    print("Private constructor called");
  }

  static get getInstance {
    _instance ??= Singleton2._internal();
    return _instance!;
  }
}

void main() {
  Singleton2 singleton1 = Singleton2.getInstance;
  Singleton2 singleton2 = Singleton2.getInstance;
  Singleton2 singleton3 = Singleton2.getInstance;
}
