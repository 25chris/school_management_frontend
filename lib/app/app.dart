import 'package:school_management/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:school_management/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:school_management/ui/views/home/home_view.dart';
import 'package:school_management/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:school_management/ui/views/user_sign_prompt/user_sign_prompt_view.dart';
import 'package:school_management/ui/views/notification/notification_view.dart';
import 'package:school_management/ui/views/timetable/timetable_view.dart';
import 'package:school_management/ui/views/school_event/school_event_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: UserSignPromptView),
    MaterialRoute(page: NotificationView),
    MaterialRoute(page: TimetableView),
    MaterialRoute(page: SchoolEventView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
