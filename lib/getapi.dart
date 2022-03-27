import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as api;

class GetAPI extends StatefulWidget {
  const GetAPI({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<GetAPI> createState() => _GetAPIState();
}

class _GetAPIState extends State<GetAPI> {
  var jsondata;

  Future<String> _Gettoday() async {
    final url = Uri.parse('https://cpsu-test-api.herokuapp.com/quizzes');
    var response = await api.get(url, headers: {'id': '07610466'});
    // Send authorization headers to the backend.
    var json = jsonDecode(response.body);
    print(json);
    return "ok";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Started'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _Gettoday(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return new Container();
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
