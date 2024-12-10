import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:class_lesson/main.dart';
import 'package:flutter/material.dart';

class IsolatePage extends StatefulWidget {
  const IsolatePage({super.key});

  @override
  State<IsolatePage> createState() => _IsolatePageState();
}

@immutable
class Person {
  final String name;
  final int age;
  const Person({
    required this.name,
    required this.age,
  });

  Person.fromJson(Map<String, dynamic> json)
      : name = json["name"] as String,
        age = json["age"] as int;
}

//example 1
/*
//receive port i.e entrance point
Future<Iterable<Person>> getPerson() async {
  final rp = ReceivePort();
  await Isolate.spawn(_getPerson, rp.sendPort);
  return await rp.first;
}

//send port i.e it send the object
void _getPerson(SendPort sp) async {
  const url = "http://127.0.0.1:5500/apis/people.json";
  final Iterable<Person> persons = await HttpClient()
      .getUrl(Uri.parse(
        url,
      ))
      .then((req) => req.close())
      .then(
        (response) => response.transform(utf8.decoder).join(),
      )
      .then(
        (jsonString) => json.decode(jsonString) as List<dynamic>,
      )
      .then(
        (json) => json.map((e) => Person.fromJson(e)),
      );
  //exiting isolate
  Isolate.exit(
    sp,
    persons,
  );
} */

//example 2 without using  Isolate.exit( sp,persons,);

/*

Stream<String> sendMessage() {
  final rp = ReceivePort();
  return Isolate.spawn(_sendMessage, rp.sendPort)
      .asStream()
      .asyncExpand((_) => rp)
      .takeWhile(
        (element) => element is String,
      )
      .cast();
}

//main function
void _sendMessage(SendPort sp) async {
  await for (final now in Stream.periodic(
    const Duration(
      seconds: 1,
    ),
    (_) => DateTime.now().toIso8601String(),
  ).take(
    2,
  )) {
    //send total of 2 msg in period of 1
    sp.send(now);
  }
  //if we use isolate.exit with msg then total of 3 msg is transmitted

  // like Isolate.exit(sp,"hello"); then hello is sent last after 2 msg of data and time

  Isolate.exit(sp);
}

void testIt() async {
  await for (var msg in sendMessage()) {
    msg.log();
  }
}
*/

@immutable
class Request {
  final SendPort sendPort;
  final Uri uri;

  const Request({
    required this.sendPort,
    required this.uri,
  });
}

void _getPerson(Request request) async {
  final Iterable<Person> persons = await HttpClient()
      .getUrl(request.uri)
      .then((req) => req.close())
      .then(
        (response) => response.transform(utf8.decoder).join(),
      )
      .then(
        (jsonString) => json.decode(jsonString) as List<dynamic>,
      )
      .then(
        (json) => json.map((e) => Person.fromJson(e)),
      );
}

class _IsolatePageState extends State<IsolatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: () async {
            //example 1
            /*
            final persons = await getPerson();
            persons.log();
            */
            //example 2
            // testIt();
          },
          child: const Text(
            "Press",
          ),
        ),
      ),
    );
  }
}
