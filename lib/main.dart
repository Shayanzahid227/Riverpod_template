import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/todo_app/todo_screen.dart';

void main() {
  runApp(const MyApp());
  // Person p = Person(name: 'John', age: 20);
  // Person p2 = p.copyWith(name: 'Jane', age: 21);
  // print(p2.name);
  // print(p2.age);
  // p.copyWith(name: 'shayan', age: 22);
  // print(p.name);
  // print(p.age);
}

// class Person {
//   final String name;
//   final int? age;
//   Person({required this.name, this.age});
//   Person copyWith({String? name, int? age}) {
//     return Person(name: name ?? this.name, age: age ?? this.age);
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // providerScop manage all the provider state in whole application
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const TodoScreen(),
      ),
    );
  }
}
