import 'package:flutter/material.dart';
import 'package:school_management/ui/views/home/widgets/homework_widgets/widgets/homeworks_list.dart';
import 'package:school_management/ui/widgets/my_appbar.dart';
import 'package:school_management/ui/widgets/my_date_picker.dart';

class HomeworkWidget extends StatelessWidget {
  const HomeworkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: 'Homework'),
      body: Column(
        children: [MyDatePicker(), HomeworksList()],
      ),
    );
  }
}
