import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:icheon_job/models/emp_job.dart';
import 'package:icheon_job/models/json_res.dart';
import 'package:icheon_job/screens/job_list.dart';
import 'package:icheon_job/screens/mw_intro.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<EmpJob> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    var url =
        "${DotEnv().env['DATAGG_API_URL']}/EmplmntInfoStus?KEY=${DotEnv().env['DATAGG_API_KEY']}&type=json&SIGUN_CD=41500";
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var wdata = JsonRes.fromJSON(json);
    var items = wdata.response[1]["row"];

    List<EmpJob> inlist = [];
    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      inlist.add(EmpJob.formJson(item));
    }

    setState(() {
      list = inlist;
    });
    //print(inlist);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Image.asset(
            "assets/logo_bi.png",
            fit: BoxFit.contain,
          ),
          actions: [
            IconButton(
                icon: new Icon(
                  Icons.question_answer,
                  color: Colors.yellow,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MwIntro()));
                })
          ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '아래로 당겨 새로고침',
            ),
            Expanded(
              child: ListView.builder(
                  itemExtent: 100.0,
                  itemCount: list.length,
                  itemBuilder: (context, index) =>
                      JobList(context, list[index], index)),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
