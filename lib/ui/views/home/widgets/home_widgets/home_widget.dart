import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_management/ui/common/app_colors.dart';
import 'package:school_management/ui/common/ui_helpers.dart';
import 'package:school_management/ui/views/home/home_viewmodel.dart';
import 'package:school_management/ui/views/home/widgets/home_widgets/widgets/home_card_widget.dart';
import 'package:school_management/ui/views/home/widgets/home_widgets/widgets/home_lesson_plan_widget.dart';
import 'package:school_management/ui/views/home/widgets/home_widgets/widgets/home_menu_widget.dart';
import 'package:school_management/ui/views/home/widgets/home_widgets/widgets/home_teachers_list_widget.dart';
import 'package:school_management/ui/views/home/widgets/home_widgets/widgets/home_user_widget.dart';
import 'package:school_management/ui/widgets/input_field.dart';

class HomeWidget extends StatefulWidget {
  final HomeViewModel viewModel;
  const HomeWidget({super.key, required this.viewModel});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  TextEditingController searchController = TextEditingController();
  TextInputFormatter searchFormatter =
      FilteringTextInputFormatter.singleLineFormatter;
  final ScrollController scrollController = ScrollController(
      initialScrollOffset: 309.0); // Assuming each item is 160 pixels wide
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          HomeUserWidget(
            viewModel: widget.viewModel,
          ),
          verticalSpaceMedium,
          InputField(
            controller: searchController,
            hintText: "Search",
            borderRadius: 20,
            borderSide: BorderSide.none,
            fillColor: kcVeryLightGrey,
            filled: true,
            inputFormatters: [searchFormatter],
            textInputType: TextInputType.text,
            prefixIcon: Icon(Icons.search_outlined),
            suffixIcon: Icon(Icons.mic_outlined),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 200, // Adjust height according to your needs
                    child: ListView.builder(
                      key: PageStorageKey<String>('myListView'),
                      controller: scrollController,
                      itemCount: 3,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => HomeCardWidget(),
                    ),
                  ),
                  verticalSpaceSmall,
                  HomeMenuWidget(
                    viewModel: widget.viewModel,
                  ),
                  verticalSpaceSmall,
                  SizedBox(
                    height: 130,
                    child: HomeTeachersListWidget(),
                  ),
                  verticalSpaceSmall,
                  HomeLessonPlanWidget()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
