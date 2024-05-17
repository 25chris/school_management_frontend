import 'package:flutter/material.dart';
import 'package:school_management/ui/common/app_colors.dart';

class NotificationTile extends StatelessWidget {
  final IconData iconData;
  final String message;
  final String details;
  final String time;
  final bool isSelected;
  final VoidCallback onTap;

  const NotificationTile({
    super.key,
    required this.iconData,
    required this.message,
    required this.details,
    required this.time,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(iconData, color: Colors.white),
        ),
        title: Text(message),
        subtitle: Text(details),
        trailing:
            Text(time, style: TextStyle(color: Colors.grey, fontSize: 12)),
        tileColor: isSelected ? Colors.lightBlueAccent : Colors.white,
      ),
    );
  }
}
