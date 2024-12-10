import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PlatformIndicator {
  Color color();
  Widget build();
  factory PlatformIndicator(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndriodIndicator();
      case TargetPlatform.iOS:
        return IosIndicator();

      default:
        return IosIndicator();
    }
  }
}

class AndriodIndicator implements PlatformIndicator {
  @override
  Widget build() {
    return CircularProgressIndicator(
      color: color(),
    );
  }

  @override
  Color color() {
    // TODO: implement color
    return Colors.blue;
  }
}

class IosIndicator implements PlatformIndicator {
  @override
  Widget build() {
    return CupertinoActivityIndicator(
      color: color(),
    );
  }

  @override
  Color color() {
    // TODO: implement color
    return Colors.blue;
  }
}
