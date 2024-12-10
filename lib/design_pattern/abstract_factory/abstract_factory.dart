import 'package:class_lesson/design_pattern/abstract_factory/factory_method_indicator.dart';
import 'package:class_lesson/design_pattern/factory_pattern/factory_method.dart';
import 'package:flutter/material.dart';

abstract class AbstractFactory {
  Widget buildButton(
      BuildContext context, VoidCallback onpressed, Widget child);
  Widget buildIndicator(BuildContext context);
}

class AbstractFactoryImp implements AbstractFactory {
  @override
  Widget buildButton(
      BuildContext context, VoidCallback onpressed, Widget child) {
    return PlatformButton(Theme.of(context).platform).build(
      onpressed,
      child,
    );
  }

  @override
  Widget buildIndicator(BuildContext context) {
    return PlatformIndicator(Theme.of(context).platform).build();
  }
}
