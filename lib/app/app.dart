import 'package:bingo_yellow/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:bingo_yellow/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:bingo_yellow/ui/views/home/home_view.dart';
import 'package:bingo_yellow/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:bingo_yellow/ui/views/bingo/bingo_view.dart';
import 'package:bingo_yellow/ui/views/table/table_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: BingoView),
    MaterialRoute(page: TableView),
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
