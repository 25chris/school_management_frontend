import 'package:flutter/material.dart';
import 'package:school_management/ui/common/app_colors.dart';
import 'package:school_management/ui/common/app_shared_style.dart';

class MidTerm extends StatelessWidget {
  MidTerm({super.key});
  final List<Map<String, String>> subjects = [
    {
      'code': 'B0023',
      'index': '0',
      'marks': '70',
      'unit': 'Past Tense',
      'name': 'English'
    },
    {
      'code': 'G9203',
      'index': '1',
      'marks': '30',
      'unit': 'Quantum Mechanics',
      'name': 'Physics'
    },
    {
      'code': 'K2942',
      'index': '2',
      'marks': '60',
      'unit': 'Linear Algebra',
      'name': 'Math'
    },
    {
      'code': 'L0029',
      'index': '3',
      'marks': '80',
      'unit': 'Renaisance Art Style',
      'name': 'Art'
    },
    {
      'code': 'M2234',
      'index': '4',
      'marks': '90',
      'unit': 'People Psychology',
      'name': 'Social Study'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(subjects.length,
          (index) => MidTermSubjectTile(subject: subjects[index])),
    );
  }
}

class MidTermSubjectTile extends StatelessWidget {
  final Map<String, String> subject;
  const MidTermSubjectTile({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: kcVeryLightGrey, width: 2),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kcLightGrey)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://picsum.photos/30${subject['index']}",
                    fit: BoxFit.cover,
                  ))),
          title: Text(subject['code']!),
          subtitle: Text(subject['name']!),
          trailing: Text(
            subject['marks']!,
            style: ktsTitleText,
          ),
        ),
      ),
    );
  }
}
