import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NotificationViewModel extends BaseViewModel {
  late bool isSelected = false;
  int? selectedNotificationIndex;

  Future<void> selectNotif({required int index}) async {
    selectedNotificationIndex = index;
    rebuildUi();
  }

  IconData getIconData(int index) {
    switch (index) {
      case 0:
        return Icons.message;
      case 1:
        return Icons.school;
      case 2:
        return Icons.star;
      case 3:
        return Icons.credit_card;
      default:
        return Icons.notification_important;
    }
  }

  String getMessage(int index) {
    switch (index) {
      case 0:
        return 'Kathryn sent you a message';
      case 1:
        return 'Try the latest courses for Liliana!';
      case 2:
        return 'Get 20% Discount for your next course';
      case 3:
        return 'Creditcard Successfully Connected!';
      default:
        return 'Notification';
    }
  }

  String getDetails(int index) {
    switch (index) {
      case 0:
        return 'Tap to see the message';
      case 1:
        return 'Let’s try the Feature we provide';
      case 2:
        return 'For all courses without requirements';
      case 3:
        return 'Credit card has been successfully connected';
      default:
        return 'Details';
    }
  }
}
