import 'package:flutter/material.dart';
import 'package:school_management/ui/views/notification/widgets/notification_tile.dart';
import 'package:school_management/ui/widgets/my_appbar.dart';
import 'package:stacked/stacked.dart';

import 'notification_viewmodel.dart';

class NotificationView extends StackedView<NotificationViewModel> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NotificationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: myAppBar(title: "Notifications"),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: ListTile(
              title: Row(
                children: [Text("Recent "), Icon(Icons.circle_rounded)],
              ),
              trailing: TextButton(onPressed: () {}, child: Text("See All")),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return NotificationTile(
                  iconData: viewModel.getIconData(index),
                  message: viewModel.getMessage(index),
                  details: viewModel.getDetails(index),
                  time: '1 months ago',
                  isSelected: viewModel.selectedNotificationIndex == index,
                  onTap: () => viewModel.selectNotif(index: index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  NotificationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NotificationViewModel();
}
