import 'package:class_lesson/main.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:meta/meta.dart';

//1st step
/*
mixin CanRun {
  //getter value
  int get speed;
  void run() {
    "Running at the speed of $speed".log();
  }
}

class Cat with CanRun {
  @override
  int speed = 10;
}

void testIt() {
  final cat = Cat();
  cat.run();
  cat.speed = 20;
  cat.run();
}
*/
//2nd step
//making restriction on mixin class
/*
mixin CanRun on Animal {
  int get speed;
  void run() {
    "running at the speed $speed".log();
  }
}

abstract class Animal {
  const Animal();
}

//cat can be made sub class of CanRun only if it extends with animal
class Cat extends Animal with CanRun {
  @override
  int speed = 20;
}

void testIt() {
  final cat = Cat();
  cat.run();
}
*/

//3rd step
extension GetOnUri on Object {
  Future<HttpClientResponse> getUrl(String url) => HttpClient()
      .getUrl(
        Uri.parse(url),
      )
      .then(
        (req) => req.close(),
      );
}

mixin CanMakeGetCall {
  String get url;
  @useResult
  Future<String> getString() => getUrl(url).then((
        resp,
      ) =>
          resp
              .transform(
                utf8.decoder,
              )
              .join());
}

@immutable
class GetPeople with CanMakeGetCall {
  const GetPeople();
  @override
  // TODO: implement url
  String get url => "http://127.0.0.1:5500/apis/people.json";
}

void testIt() async {
  final people = await const GetPeople().getString();
  people.log();
}

class MixinProperty extends StatefulWidget {
  const MixinProperty({super.key});

  @override
  State<MixinProperty> createState() => _MixinPropertyState();
}

class _MixinPropertyState extends State<MixinProperty> {
  @override
  Widget build(BuildContext context) {
    testIt();
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
