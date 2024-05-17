import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:school_management/ui/common/app_colors.dart';
import 'package:school_management/ui/common/app_shared_style.dart';
import 'package:school_management/ui/common/ui_helpers.dart';

class HomeLessonPlanWidget extends StatelessWidget {
  HomeLessonPlanWidget({super.key});

  final chipsLabel = ["All", "English", "Physics", "Math"];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Lessons Plan",
                style: ktsBodyLarge,
              ),
              TextButton(onPressed: () {}, child: Text("See All"))
            ],
          ),
        ),
        SizedBox(
          height: 50,
          child: ListView.builder(
            key: PageStorageKey<String>('myListView'),
            itemCount: chipsLabel.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ChoiceChip(
                  padding: EdgeInsets.all(8),
                  disabledColor: kcWhite,
                  selectedColor: kcBlue,
                  color: MaterialStateProperty.all(kcBlue),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: kcBlue)),
                  label: Text(
                    chipsLabel[index],
                    style: ktsBodyRegular.copyWith(
                        color: kcBlue, fontWeight: FontWeight.w500),
                  ),
                  selected: false),
            ),
          ),
        ),
        verticalSpaceSmall,
        ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          "https://picsum.photos/300?image=$index",
                          fit: BoxFit.cover,
                        )),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kcLightGrey),
                          child: Text(
                            chipsLabel[index],
                            style: ktsBodyRegular.copyWith(fontSize: 10),
                          ),
                        ),
                        Text(
                          faker.conference.name(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: ktsBodyLarge.copyWith(fontSize: 15),
                        ),
                        Text.rich(
                          TextSpan(children: [
                            TextSpan(
                                text: "Assigned by: ",
                                style: ktsBodyRegular.copyWith(
                                    color: kcLightGrey)),
                            TextSpan(text: faker.person.name()),
                          ]),
                          style: ktsBodyRegular.copyWith(fontSize: 11),
                        ),
                        verticalSpaceSmall,
                        Row(
                          children: [
                            Icon(Icons.timer_outlined),
                            Text("2024-12-12")
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
