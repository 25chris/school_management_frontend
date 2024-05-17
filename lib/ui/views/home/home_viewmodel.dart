import 'package:flutter/material.dart';
import 'package:school_management/app/app.locator.dart';
import 'package:school_management/app/app.router.dart';
import 'package:school_management/ui/views/home/widgets/event_widgets/event_widget.dart';
import 'package:school_management/ui/views/home/widgets/grades_widgets/grade_widget.dart';
import 'package:school_management/ui/views/home/widgets/holiday_widgets/holiday_widget.dart';
import 'package:school_management/ui/views/home/widgets/home_widgets/home_widget.dart';
import 'package:school_management/ui/views/home/widgets/homework_widgets/homework_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  // final _dialogService = locator<DialogService>();
  // final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  int currentIndex = 2;
  List<Widget> body({required HomeViewModel viewModel}) => [
        GradesWidget(),
        HolidayWidget(),
        HomeWidget(
          viewModel: viewModel,
        ),
        HomeworkWidget(),
        EventWidget()
      ];

  void tapNewIndex(int newIndex) {
    currentIndex = newIndex;
    rebuildUi();
  }

  //NAVIGATION

  void toNotificationView() {
    // _navigationService.navigateToNotificationView();
  }

  void toAttendanceView() {
    // _navigationService.navigateToAttendanceView();
  }

  void toEventView() {
    _navigationService.navigateToSchoolEventView();
  }

  void toTlimetableView() {
    _navigationService.navigateToTimetableView();
  }

  void toAssignmentView() {
    // _navigationService.navigateToAssignmentView();
  }
}
