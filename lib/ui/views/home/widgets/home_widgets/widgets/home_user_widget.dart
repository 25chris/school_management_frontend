import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:school_management/ui/common/app_colors.dart';
import 'package:school_management/ui/common/app_shared_style.dart';
import 'package:school_management/ui/views/home/home_viewmodel.dart';

class HomeUserWidget extends StatelessWidget {
  final HomeViewModel viewModel;
  const HomeUserWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage("https://picsum.photos/300"),
      ),
      title: Text(
        "Good Morning",
        style: ktsBodyRegular.copyWith(color: kcMediumGrey),
      ),
      subtitle: Text(
        faker.person.name(),
        style: ktsBodyRegular.copyWith(
            color: kcPrimaryColorDark, fontWeight: FontWeight.w600),
      ),
      trailing: CircleAvatar(
        radius: 15,
        child: IconButton(
            onPressed: () => viewModel.toNotificationView(),
            icon: Icon(
              Icons.notifications,
              size: 15,
              color: kcWhite,
            )),
      ),
    );
  }
}
