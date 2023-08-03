import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../UI_components/badge.dart';
import '../UI_components/info_detail.dart';

final treatmentMock = {
  "startDate": "2023/07/28",
  "duration": "14",
  "name": "FOLFOX (Oxaliplatin + 5-FU + Leucovorin)",
  "maxCount": "12"
};

class TreatmentPage extends StatelessWidget {
  final DateTime startDate;
  final Duration duration;
  final String name;
  final int maxCount;

  const TreatmentPage(
      {Key? key,
      required this.startDate,
      required this.duration,
      required this.name,
      required this.maxCount})
      : super(key: key);

  String get frequencyString {
    if (duration.inDays >= 7) {
      return "${duration.inDays ~/ 7}週一次";
    }
    return "${duration.inDays}天一次";
  }

  List<Widget> _frequencyList() {
    final now = DateTime.now();
    DateTime start = startDate.copyWith();
    return List.generate(maxCount, (index) {
      if (now.isAfter(start.add(duration * index))) {
        final endDate = start.add(duration * index);
        final DateFormat dateFormat = DateFormat("MM/dd");
        return TreatmentBadge(
            isFinish: true, finishDate: dateFormat.format(endDate));
      } else {
        return TreatmentBadge(isFinish: false, number: index + 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat("yyyy/MM/dd");
    const textStyle =
        TextStyle(fontSize: 18, color: Color.fromRGBO(83, 83, 83, 1.0));
    return InfoDetail(
      title: "化學治療 • 療程",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("藥物： ", style: textStyle),
                    Flexible(
                      child: Text(
                        name,
                        maxLines: 3,
                        style: textStyle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Text(
                  "開始： ${dateFormat.format(startDate)} $frequencyString",
                  style: textStyle,
                )
              ],
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color.fromRGBO(250, 250, 250, 1.0),
                ),
                child: Wrap(spacing: 20.0, children: _frequencyList()),
              ),
            ),
          )
        ],
      ),
    );
  }
}
