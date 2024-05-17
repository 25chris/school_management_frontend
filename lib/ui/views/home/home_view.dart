import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:school_management/ui/common/app_colors.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: viewModel.body(viewModel: viewModel)[viewModel.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: viewModel.currentIndex,
          onTap: (int newIndex) => viewModel.tapNewIndex(newIndex),
          items: const [
            BottomNavigationBarItem(
                label: "",
                icon: Icon(
                  Icons.calendar_today_outlined,
                  color: kcPrimaryColorDark,
                ),
                activeIcon: Icon(Icons.calendar_today_outlined, color: kcBlue)),
            BottomNavigationBarItem(
                label: "",
                icon: Icon(Icons.calendar_month_outlined,
                    color: kcPrimaryColorDark),
                activeIcon: Icon(Icons.calendar_month_outlined, color: kcBlue)),
            BottomNavigationBarItem(
                label: "",
                icon: Icon(Icons.home_outlined, color: kcPrimaryColorDark),
                activeIcon: Icon(Icons.home_outlined, color: kcBlue)),
            BottomNavigationBarItem(
                label: "",
                icon:
                    Icon(Icons.description_outlined, color: kcPrimaryColorDark),
                activeIcon: Icon(Icons.description_outlined, color: kcBlue)),
            BottomNavigationBarItem(
                label: "",
                icon: Icon(Icons.timer_outlined, color: kcPrimaryColorDark),
                activeIcon: Icon(Icons.timer_outlined, color: kcBlue)),
          ]),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
