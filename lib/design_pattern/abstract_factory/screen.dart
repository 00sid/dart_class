import 'package:class_lesson/design_pattern/abstract_factory/abstract_factory.dart';
import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AbstractFactoryImp().buildButton(
            context,
            () {},
            Text("Click"),
          ),
        ],
      ),
    );
  }
}
