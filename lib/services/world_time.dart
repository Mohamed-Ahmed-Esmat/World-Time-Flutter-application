import 'dart:convert';

import 'package:http/http.dart';

class WorldTime {
  var location;
  var time;
  var flag;
  var url;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    Uri apiurl = Uri.parse("https://worldtimeapi.org/api/timezone/$url");
    Response response = await get(apiurl); // Use the http alias here
    Map data = jsonDecode(response.body);
    // print(data);
    var datetime = data['datetime'];
    var offset = data['utc_offset'].substring(1, 3);
    //print(offset);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    time = now.toString();
  }
}
