import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:clipboard/clipboard.dart';
import 'package:zoom/meeting.dart';
import 'package:zoom/meeting_list.dart';

List<Meeting> meetings = [
  Meeting("Dynamics", TimeOfDay(hour: 15, minute: 30), "239487",
      password: "sdfkj768"),
  Meeting("Dynamics", TimeOfDay(hour: 15, minute: 30), "239487",
      password: "sdfkj768"),
  Meeting("Dynamics", TimeOfDay(hour: 15, minute: 30), "239487",
      password: "sdfkj768"),
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        body: MeetingList(initialMeetingList: meetings, title: "Monday"));
  }
}
