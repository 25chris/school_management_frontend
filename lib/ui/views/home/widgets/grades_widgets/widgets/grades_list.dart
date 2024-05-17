import 'package:flutter/material.dart';
import 'package:school_management/ui/common/ui_helpers.dart';
import 'package:school_management/ui/views/home/widgets/grades_widgets/widgets/mid_term.dart';

void main() {
  runApp(MaterialApp(home: GradesList()));
}

class GradesList extends StatefulWidget {
  const GradesList({Key? key}) : super(key: key);

  @override
  State<GradesList> createState() => _GradesListState();
}

class _GradesListState extends State<GradesList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[200], // Example color
              ),
              child: TabBar(
                controller: _tabController,
                unselectedLabelColor: Colors.black,
                labelColor: Colors.white,
                labelStyle: TextStyle(fontSize: 16),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blue,
                ),
                tabs: [
                  Tab(text: "Mid Term"),
                  Tab(text: "Final Term"),
                  Tab(text: "Test Result"),
                ],
              ),
            ),
          ),
          verticalSpaceMedium,
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                MidTerm(),
                Center(child: Text('Final Term Content')),
                Center(child: Text('Test Result Content')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
