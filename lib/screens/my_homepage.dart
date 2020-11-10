import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:icheon_job/models/emp_job.dart';
import 'package:icheon_job/models/json_res.dart';
import 'package:icheon_job/screens/job_card.dart';
import 'package:icheon_job/screens/job_list.dart';
import 'package:icheon_job/screens/mw_intro.dart';
import 'package:icheon_job/size_config.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../models/emp_job.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<EmpJob> list = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    print("pull refresh");
    getData();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()

    if (mounted) setState(() {});
    _refreshController.loadComplete();
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
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("release to load more");
            } else {
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onLoading: _onLoading,
        onRefresh: onRefresh,
        child: Container(
          height: MediaQuery.of(context).size.height * 1.2,
          width: MediaQuery.of(context).size.width * 3.4,
          child: ListView.builder(
              itemExtent: 100.0,
              itemCount: list.length == null ? 0 : list.length,
              itemBuilder: (context, index) =>
                  JobCard(context, list[index], index)),
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
