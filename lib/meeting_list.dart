import 'package:flutter/material.dart';
import 'meeting.dart';

class MeetingList extends StatefulWidget {
  final List<Meeting> initialMeetingList;
  final String title;

  MeetingList({this.initialMeetingList, this.title});

  @override
  _MeetingListState createState() => _MeetingListState();
}

class _MeetingListState extends State<MeetingList> {
  List<Meeting> _meetings;

  @override
  void initState() {
    super.initState();
    _meetings = widget.initialMeetingList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        initialItemCount: widget.initialMeetingList.length + 1,
        shrinkWrap: false,
        itemBuilder: (context, index, animation) {
          if (index == 0) {
            return Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Text(widget.title,
                    style:
                        TextStyle(fontSize: 42, fontWeight: FontWeight.w200)));
          }
          return MeetingWidget(_meetings[index - 1]);
        });
  }
}
