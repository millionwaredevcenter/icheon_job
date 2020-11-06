import 'package:flutter/material.dart';

class MwIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("앱소개"),
      ),
        body: Container(
        child: Text("이천을 대표하는 IT 전문기업, 밀리언웨어"),
      ),
    );
  }
}