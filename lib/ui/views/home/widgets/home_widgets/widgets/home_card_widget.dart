import 'package:flutter/material.dart';
import 'package:school_management/ui/common/app_colors.dart';
import 'package:school_management/ui/common/app_shared_style.dart';
import 'package:school_management/ui/common/ui_helpers.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Container(
        width: 309,
        height: 126,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [kcBlue, kcViolet])),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Result Declaration & Graduation Ceremony",
                        style: ktsBodyRegular.copyWith(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: kcWhite),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.timer_outlined, color: kcWhite),
                          horizontalSpaceSmall,
                          Text(
                            "17:00 - 18:30",
                            style: ktsBodyRegular.copyWith(
                                fontFamily: "Poppins",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: kcWhite),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.pin_drop_outlined,
                            color: kcWhite,
                          ),
                          horizontalSpaceSmall,
                          Text(
                            "17:00 - 18:30",
                            style: ktsBodyRegular.copyWith(
                                fontFamily: "Poppins",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: kcWhite),
                          )
                        ],
                      )
                    ],
                  )),
              Expanded(child: Image.asset("assets/png/graduate.png"))
            ],
          ),
        ),
      ),
    );
  }
}
