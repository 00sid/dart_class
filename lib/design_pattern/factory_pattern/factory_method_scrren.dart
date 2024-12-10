import 'package:class_lesson/design_pattern/factory_pattern/factory_method.dart';
import 'package:flutter/material.dart';

class FactoryTestScreen extends StatefulWidget {
  const FactoryTestScreen({super.key});

  @override
  State<FactoryTestScreen> createState() => _FactoryTestScreenState();
}

class _FactoryTestScreenState extends State<FactoryTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PlatformButton(Theme.of(context).platform).build(
          () {},
          const Text("Click me"),
        ),
      ),
    );
  }
}
