import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:school_management/ui/common/app_colors.dart';
import 'package:school_management/ui/common/app_shared_style.dart';

class MyDatePicker extends StatelessWidget {
  MyDatePicker({super.key});
  final DatePickerController? controller = DatePickerController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.chevron_left,
                    color: kcPrimaryColorDark,
                  )),
            ),
            Expanded(
                flex: 2,
                child: Text(
                  "April 2024",
                  textAlign: TextAlign.center,
                  style: ktsBodyRegular,
                )),
            Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.chevron_right,
                    color: kcPrimaryColorDark,
                  )),
            ),
          ],
        ),
        DatePicker(
          DateTime.now().subtract(const Duration(days: 11)),
          controller: controller,
          initialSelectedDate: DateTime.now(),
          selectionColor: Colors.teal,
          selectedTextColor: Colors.white,
          activeDates: List.generate(
              10, (index) => DateTime.now().subtract(Duration(days: index))),
          daysCount: 14, // 10 days back, current day, 3 days forward
          onDateChange: (date) {},
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Today",
              textAlign: TextAlign.start,
              style: ktsBodyRegular.copyWith(
                  fontSize: 17, fontWeight: FontWeight.w600)),
        )
      ],
    );
  }
}
