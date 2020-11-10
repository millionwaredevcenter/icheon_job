import 'package:flutter/material.dart';
import 'package:icheon_job/constants.dart';
import 'package:icheon_job/models/emp_job.dart';
import 'package:icheon_job/screens/job_detail.dart';

Widget JobCard(BuildContext context, EmpJob card, int index) {
  var title = card.emplmntTitle;
  var company = card.companyNm;
  var jobno = card.joboffrCertfiyNo;
  var address = card.workplcBasisAddr;
  var wageform = card.wageForm;
  var salary = card.salaryInfo;

  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => JobDetail(
                    job: card,
                  )));
    },
    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.95,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [kDefualtShadow]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${company}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Spacer(),
            Text('${title}'),
            Spacer(),
            Text('[${wageform}] ${salary}'),
            Spacer(),
            Spacer(),
            Text(
              '${address}',
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    ]),
  );
}
