import 'package:flutter/material.dart';

class TimetableSchedule extends StatefulWidget {
  const TimetableSchedule({super.key});

  @override
  State<TimetableSchedule> createState() => _TimetableScheduleState();
}

class _TimetableScheduleState extends State<TimetableSchedule> {
  int _selectedSubjectIndex = 0;
  // Index to track selected subject
  final List<Map<String, String>> subjects = [
    {'time': '9:00 am - 9:30 am', 'name': 'English'},
    {'time': '9:00 am - 9:30 am', 'name': 'Physics'},
    {'time': '9:00 am - 9:30 am', 'name': 'Math'},
    {'time': '9:00 am - 9:30 am', 'name': 'Chemistry'},
    {'time': '9:00 am - 9:30 am', 'name': 'Art'},
    {'time': '9:00 am - 9:30 am', 'name': 'Social Study'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(subjects.length, (index) {
        return GestureDetector(
          onTap: () => setState(() => _selectedSubjectIndex = index),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color:
                  _selectedSubjectIndex == index ? Colors.blue : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.only(top: 3, bottom: 3, right: 16),
              leading: Radio(
                value: index,
                groupValue: _selectedSubjectIndex,
                onChanged: (int? value) {
                  setState(() {
                    _selectedSubjectIndex = value!;
                  });
                },
                activeColor: Colors.blue,
              ),
              title: Text(subjects[index]['time']!,
                  style: TextStyle(
                      color: _selectedSubjectIndex == index
                          ? Colors.white
                          : Colors.black)),
              trailing: Text(subjects[index]['name']!,
                  style: TextStyle(
                      color: _selectedSubjectIndex == index
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        );
      }),
    );
  }
}
