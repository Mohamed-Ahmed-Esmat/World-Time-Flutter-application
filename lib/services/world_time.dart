import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  var location;
  var time;
  var flag;
  var url;
  var isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Uri apiurl = Uri.parse("https://worldtimeapi.org/api/timezone/$url");
      Response response = await get(apiurl); // Use the http alias here
      Map data = jsonDecode(response.body);
      // print(data);
      var datetime = data['datetime'];
      var offset = data['utc_offset'].substring(1, 3);
      //print(offset);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = "cannot load data";
    }
  }
}
