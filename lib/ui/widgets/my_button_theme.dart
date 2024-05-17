import 'package:flutter/material.dart';
import 'package:school_management/ui/common/app_colors.dart';
import 'package:school_management/ui/common/app_shared_style.dart';

class MyButtonTheme extends StatelessWidget {
  final VoidCallback onPressed; // Corrected the type of the onPressed function
  final String label;
  const MyButtonTheme(
      {super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          MediaQuery.of(context).size.width, // Takes full width of the screen
      height: 52, // Fixed height of 52 pixels
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(30)), // Rounded corners with a radius of 30
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
                kcPrimaryColor), // Assuming you have a primary color defined
          ),
          onPressed: onPressed, // Correct usage of onPressed
          child: Text(
            label,
            style: ktsBodyRegular.copyWith(
                color: kcWhite), // Assuming these styles are defined
          )),
    );
  }
}
