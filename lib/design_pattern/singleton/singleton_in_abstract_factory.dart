import 'package:class_lesson/design_pattern/abstract_factory/factory_method_indicator.dart';
import 'package:class_lesson/design_pattern/factory_pattern/factory_method.dart';
import 'package:flutter/material.dart';

abstract class AbstractFactorySingleTon {
  Widget buildButton(
      BuildContext context, VoidCallback onpressed, Widget child);
  Widget buildIndicator(BuildContext context);
}

class AbstractFactoryImpSingleTon implements AbstractFactorySingleTon {
  static AbstractFactoryImpSingleTon? _instance;
  AbstractFactoryImpSingleTon._private() {
    //it is called only one times
    print("Hello");
  }

  static AbstractFactoryImpSingleTon get instance {
    _instance ??= AbstractFactoryImpSingleTon._private();
    return _instance!;
  }

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

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //circular progress indicator
        AbstractFactoryImpSingleTon.instance.buildIndicator(
          context,
        ),
      ],
    );
  }
}
