import 'package:flutter/material.dart';
import 'package:school_management/app/app.locator.dart';
import 'package:school_management/app/app.router.dart';
import 'package:school_management/ui/common/app_colors.dart';
import 'package:school_management/ui/common/app_shared_style.dart';
import 'package:stacked_services/stacked_services.dart';

final _navigationService = locator<NavigationService>();

PreferredSizeWidget? myAppBar({required String title}) {
  return AppBar(
    elevation: 0,
    backgroundColor: kcVeryLiteWhite,
    leading: IconButton(
        onPressed: () => _navigationService.navigateToHomeView(),
        icon: const Icon(
          Icons.chevron_left_outlined,
          color: kcPrimaryColorDark,
        )),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 15,
          child: IconButton(
              onPressed: () => _navigationService.navigateToNotificationView(),
              icon: const Icon(
                Icons.notifications,
                size: 15,
                color: kcWhite,
              )),
        ),
      )
    ],
    title: Text(
      title,
      style: ktsBodyRegular.copyWith(
          color: kcPrimaryColorDark, fontWeight: FontWeight.w600),
    ),
    centerTitle: true,
  );
}
