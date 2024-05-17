import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:school_management/ui/common/app_colors.dart';
import 'package:school_management/ui/common/app_shared_style.dart';
import 'package:school_management/ui/common/ui_helpers.dart';

class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (context, index) => EventTile(myIndex: index),
    );
  }
}

class EventTile extends StatelessWidget {
  final int myIndex;
  const EventTile({super.key, required this.myIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 330,
            height: 141,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      color: kcDarkGreyColor,
                      blurRadius: .4,
                      spreadRadius: 0,
                      offset: Offset(1, 0)),
                ]),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(
                "https://picsum.photos/300?image=$myIndex",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 330,
            height: 80,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: kcWhite,
                boxShadow: [
                  BoxShadow(
                      color: kcDarkGreyColor,
                      blurRadius: .4,
                      spreadRadius: 0,
                      offset: Offset(1, 1)),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "In House Event",
                    style: ktsBodyRegular.copyWith(
                        fontSize: 11, color: kcLightGrey),
                  ),
                  verticalSpaceSmall,
                  Text(
                    faker.conference.name(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: ktsBodyRegular.copyWith(
                        fontSize: 13,
                        color: kcPrimaryColorDark,
                        fontWeight: FontWeight.w500),
                  ),
                  verticalSpaceTiny,
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.pin_drop_outlined,
                            color: kcBlue,
                            size: 11,
                          ),
                          Text(
                            faker.address.city(),
                            style: ktsBodyRegular.copyWith(
                                fontSize: 11,
                                color: kcPrimaryColorDark,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      horizontalSpaceSmall,
                      Row(
                        children: [
                          const Icon(
                            Icons.timer_outlined,
                            color: kcBlue,
                            size: 11,
                          ),
                          Text(
                            "${faker.date.time()} - ${faker.date.time()}",
                            style: ktsBodyRegular.copyWith(
                                fontSize: 11,
                                color: kcPrimaryColorDark,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
