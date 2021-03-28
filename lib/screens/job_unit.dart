import 'package:flutter/material.dart';

class JobUnit extends StatelessWidget {
  final String title;
  final String content;

  const JobUnit({Key key, @required this.title, @required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: unnecessary_brace_in_string_interps
        children: [
          Text(
            "${title}",
            style: TextStyle(fontSize: 12),
          ),
          Spacer(),
          Text(
            "${content}",
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }
}
