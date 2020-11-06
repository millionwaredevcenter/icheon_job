import 'package:flutter/material.dart';
import 'package:icheon_job/models/emp_job.dart';

class JobDetail extends StatelessWidget {
  final EmpJob job;

  const JobDetail({Key key,@required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${job.companyNm}")),
      body: Container(
        child: Text("${job.emplmntTitle}"),
      ),
    );
  }
}
