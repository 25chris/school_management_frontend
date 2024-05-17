import 'package:flutter/material.dart';
import 'package:school_management/ui/views/timetable/widgets/timetable_schedule.dart';
import 'package:school_management/ui/widgets/my_appbar.dart';
import 'package:school_management/ui/widgets/my_date_picker.dart';
import 'package:stacked/stacked.dart';

import 'timetable_viewmodel.dart';

class TimetableView extends StackedView<TimetableViewModel> {
  const TimetableView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TimetableViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: myAppBar(title: 'Timetable'),
      body: Column(
        children: [MyDatePicker(), TimetableSchedule()],
      ),
    );
  }

  @override
  TimetableViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TimetableViewModel();
}
