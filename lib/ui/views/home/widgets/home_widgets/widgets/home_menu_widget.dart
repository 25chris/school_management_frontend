import 'package:flutter/material.dart';
import 'package:school_management/ui/common/app_colors.dart';
import 'package:school_management/ui/common/app_shared_style.dart';
import 'package:school_management/ui/common/ui_helpers.dart';
import 'package:school_management/ui/views/home/home_viewmodel.dart';

class HomeMenuWidget extends StatelessWidget {
  final HomeViewModel viewModel;
  HomeMenuWidget({super.key, required this.viewModel});

  final List menuIcons = [
    Icons.calendar_today_outlined,
    Icons.event_outlined,
    Icons.timer_outlined,
    Icons.description_outlined
  ];

  final List menuLabel = ["Attendance", "Event", "Timetable", "Assignment"];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          4,
          (index) => GestureDetector(
                onTap: () => index == 0
                    ? viewModel.toAttendanceView()
                    : index == 1
                        ? viewModel.toEventView()
                        : index == 2
                            ? viewModel.toTlimetableView()
                            : viewModel.toAssignmentView(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: kcLiteWhite,
                      child: Icon(
                        menuIcons[index],
                        size: 33,
                        color: kcBlue,
                      ),
                    ),
                    verticalSpaceSmall,
                    Text(
                      menuLabel[index],
                      style: ktsBodyRegular,
                    )
                  ],
                ),
              )),
    );
  }
}
