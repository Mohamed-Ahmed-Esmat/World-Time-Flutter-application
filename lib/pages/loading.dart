import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/todos/1");
    Response response = await get(url); // Use the http alias here
    Map data = jsonDecode(response.body);
    print(data['title']);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Text("Loading Screen"),
    );
  }
}
