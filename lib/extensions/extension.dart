//extension on int

extension IntExt on int {
  int get timesFour => this * 4;
}

void main() {
  final int value = 6;
  print(value.timesFour);
}
