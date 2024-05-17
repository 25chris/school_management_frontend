import 'package:flutter/material.dart';
import 'package:school_management/ui/common/app_colors.dart';
import 'package:school_management/ui/common/app_shared_style.dart';

class HomeworksList extends StatelessWidget {
  HomeworksList({super.key});
  final List<Map<String, String>> subjects = [
    {'marks': '70', 'unit': 'Past Tense', 'name': 'English'},
    {'marks': '30', 'unit': 'Quantum Mechanics', 'name': 'Physics'},
    {'marks': '60', 'unit': 'Linear Algebra', 'name': 'Math'},
    {'marks': '80', 'unit': 'Renaisance Art Style', 'name': 'Art'},
    {'marks': '90', 'unit': 'People Psychology', 'name': 'Social Study'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          subjects.length, (index) => HomeworkTile(subject: subjects[index])),
    );
  }
}

class HomeworkTile extends StatelessWidget {
  final Map<String, String> subject;
  HomeworkTile({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: kcBlue),
          child: Text.rich(
            TextSpan(children: [
              TextSpan(
                text: subject['marks'],
                style: ktsBodyRegular.copyWith(
                    color: kcWhite, fontWeight: FontWeight.w800, fontSize: 17),
              ),
              TextSpan(
                text: "\nMarks",
                style: ktsBodyRegular.copyWith(color: kcWhite),
              ),
            ]),
            textAlign: TextAlign.center,
          ),
        ),
        title: Text(subject['name']!),
        subtitle: Text(subject['unit']!),
        trailing: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: kcLiteWhite),
          child: Text(
            "View",
            style: ktsBodyRegular,
          ),
        ),
      ),
    );
  }
}
