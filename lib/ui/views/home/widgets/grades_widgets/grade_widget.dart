import 'package:flutter/material.dart';
import 'package:school_management/ui/views/home/widgets/grades_widgets/widgets/grades_list.dart';
import 'package:school_management/ui/widgets/my_appbar.dart';

class GradesWidget extends StatelessWidget {
  const GradesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: 'Grades'),
      body: GradesList(),
    );
  }
}
