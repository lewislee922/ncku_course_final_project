import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../icon_image.dart';
import '../pages/adr_record_page.dart';
import '../pages/news_page.dart';
import '../pages/notices_page.dart';
import '../pages/resource_page.dart';
import '../pages/treatment_page.dart';

final Map<String, String> optionsMap = {
  "化療過程 注意事項": IconImage.treatment,
  "記錄丨我的療程": IconImage.pills,
  "記錄丨副作用": IconImage.nausea,
  "關懷資源": IconImage.talking,
  "衛教新知": IconImage.doctorRun
};

final Map<String, Widget?> optionsWidgets = {
  "化療過程 注意事項": NoticesPage(),
  "記錄丨我的療程": TreatmentPage(
      startDate: DateFormat("yyyy/MM/dd").parse(treatmentMock['startDate']!),
      duration: Duration(days: int.parse(treatmentMock["duration"]!)),
      name: treatmentMock['name']!,
      maxCount: int.parse(treatmentMock["maxCount"]!)),
  "記錄丨副作用": const ADRRecordPage(),
  "關懷資源": const ResourcePage(),
  "衛教新知": const NewsPage(),
};

class OptionTile extends StatelessWidget {
  final String title;
  final String image;
  final Color? backgroundColor;

  const OptionTile({
    Key? key,
    required this.title,
    required this.image,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (optionsWidgets[title] != null) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => optionsWidgets[title]!));
        }
      },
      child: Card(
        margin: EdgeInsets.zero,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: backgroundColor ?? const Color.fromARGB(255, 80, 108, 104),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(image, width: 65, height: 65),
                    const SizedBox(width: 8.0),
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          title,
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 32,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
