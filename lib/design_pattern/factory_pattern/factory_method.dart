import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PlatformButton {
  Widget build(VoidCallback onpressed, Widget child);

  factory PlatformButton(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndriodButton();
      case TargetPlatform.iOS:
        return IosButton();
      default:
        return AndriodButton();
    }
  }
}

class AndriodButton implements PlatformButton {
  @override
  Widget build(VoidCallback onpressed, Widget child) {
    return MaterialButton(
      onPressed: onpressed,
      child: child,
    );
  }
}

class IosButton implements PlatformButton {
  @override
  Widget build(VoidCallback onpressed, Widget child) {
    return CupertinoButton(
      child: child,
      onPressed: onpressed,
    );
  }
}
