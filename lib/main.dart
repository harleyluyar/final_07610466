import 'package:finaltest/welcome.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as api;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  void getdata() {
    final url = Uri.parse('https://cpsu-test-api.herokuapp.com/quizzes');
    var response = api.get(url, headers: {'id': '07610466'});
    print(response);
    print(url);
  }

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getdata();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const WelcomePage(title: 'Final Exam Game'),
    );
  }
}
