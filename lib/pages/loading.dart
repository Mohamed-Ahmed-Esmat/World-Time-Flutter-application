import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    Uri url = Uri.parse("https://worldtimeapi.org/api/timezone/Europe/London");
    Response response = await get(url); // Use the http alias here
    Map data = jsonDecode(response.body);
    // print(data);
    var datetime = data['datetime'];
    var offset = data['utc_offset'].substring(1, 3);
    print(datetime);
    //print(offset);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getTime();
    return Scaffold(
      body: Text("Loading Screen"),
    );
  }
}
