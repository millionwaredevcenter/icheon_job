import 'package:flutter/material.dart';
import 'package:icheon_job/models/emp_job.dart';

Widget JobList(BuildContext context, EmpJob job, int index) {
  return ListTile(
    onTap: () {},
    title: Text("${job.companyNm}"),
    leading: Text("${job.joboffrCertfiyNo}"),
    subtitle: Text("${job.emplmntTitle}"),
  );
}
