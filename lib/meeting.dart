import 'package:flutter/material.dart';

class Meeting {
  String name;
  TimeOfDay time;
  String id;
  String password;
  bool inPerson;

  Meeting(this.name, this.time, this.id,
      {this.inPerson = false, this.password = ""});
}

class MeetingWidget extends StatelessWidget {
  final Meeting meeting;

  MeetingWidget(
    this.meeting,
  );

  @override
  Widget build(BuildContext context) {
    final hour = meeting.time.hour;
    final minute = meeting.time.minute;
    final suffix = hour > 11 ? "PM" : "AM";
    final displayHour = hour > 11 ? (hour - 12) : hour;
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.only(top: 16),
            child: FractionallySizedBox(
                widthFactor: 1.0,
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              color: Colors.grey,
                              width: 1,
                              style: BorderStyle.solid)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(meeting.name,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Row(children: [
                              Text("Zoom ID: ${meeting.id}"),
                              SizedBox(width: 8),
                              TextButton(
                                child: Text("COPY"),
                                onPressed: () {
                                  final snackBar = SnackBar(
                                      content: Text('Zoom ID Copied!'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                              ),
                            ]),
                            meeting.password != ""
                                ? Row(
                                    children: [
                                      Text(
                                          "Meeting Password: ${meeting.password}"),
                                      SizedBox(width: 8),
                                      TextButton(
                                        child: Text("COPY"),
                                        onPressed: () {},
                                      ),
                                    ],
                                  )
                                : Container(),
                            SizedBox(height: 24),
                            ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                              ),
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text("Join Zoom Room")),
                              onPressed: () {},
                            )
                          ]),
                    )))),
        Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.symmetric(horizontal: 6),
                color: Colors.white,
                child: Text("$displayHour:$minute $suffix",
                    style: TextStyle(fontStyle: FontStyle.italic))))
      ],
    );
  }
}
