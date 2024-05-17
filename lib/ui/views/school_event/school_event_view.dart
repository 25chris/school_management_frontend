import 'package:flutter/material.dart';
import 'package:school_management/ui/views/school_event/widgets/event_list.dart';
import 'package:school_management/ui/widgets/my_appbar.dart';
import 'package:stacked/stacked.dart';

import 'school_event_viewmodel.dart';

class SchoolEventView extends StackedView<SchoolEventViewModel> {
  const SchoolEventView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SchoolEventViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: myAppBar(title: "Events"),
      body: EventList(),
    );
  }

  @override
  SchoolEventViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SchoolEventViewModel();
}
