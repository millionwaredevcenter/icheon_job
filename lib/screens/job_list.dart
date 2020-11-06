import 'package:flutter/material.dart';
import 'package:icheon_job/models/emp_job.dart';
import 'package:icheon_job/screens/job_detail.dart';

Widget JobList(BuildContext context, EmpJob job, int index) {
  return ListTile(
    onTap: () {
      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => JobDetail(job: job,)));
    },
    title: Text("${job.companyNm}"),
    leading: Text("${job.joboffrCertfiyNo}"),
    subtitle: Text("${job.emplmntTitle}"),
  );
}
