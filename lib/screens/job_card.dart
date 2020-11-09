import 'package:flutter/material.dart';
import 'package:icheon_job/constants.dart';
import 'package:icheon_job/models/emp_job.dart';
import 'package:icheon_job/screens/job_detail.dart';
import 'package:icheon_job/size_config.dart';

Widget JobCard(BuildContext context, EmpJob card, int index) {
  var title = card.emplmntTitle;
  var company = card.companyNm;
  var jobno = card.joboffrCertfiyNo;
  var address = card.workplcBasisAddr;

  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => JobDetail(
                    job: card,
                  )));
    },
    child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(5),
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
                Text(
                  '워크넷 구직번호 : ${jobno}',
                  style: TextStyle(fontSize: 12),
                ),
                Spacer(),
                Text(
                  '${address}',
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
          VerticalSpacing()
        ])),
  );
}
