import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:school_management/ui/common/app_shared_style.dart';

class HomeTeachersListWidget extends StatelessWidget {
  const HomeTeachersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subject Teachers",
                style: ktsBodyLarge,
              ),
              TextButton(onPressed: () {}, child: Text("See All"))
            ],
          ),
        ),
        Flexible(
          child: ListView.builder(
            key: PageStorageKey<String>('myListView'),
            itemCount: 9,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: 75,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 31,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage("https://picsum.photos/40$index"),
                      ),
                    ),
                    Text(
                      faker.person.name(),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: ktsBodyRegular.copyWith(fontSize: 11),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
