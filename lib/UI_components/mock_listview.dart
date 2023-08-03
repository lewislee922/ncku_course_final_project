import 'package:flutter/material.dart';

import '../mock_data.dart';

class PatientDataListView extends StatelessWidget {
  final Map<String, String> _titleMap = {
    "癌症名稱": "cancerName",
    "診斷日期": "diagnosisDate",
    "首次化療": "initialDate",
    "化療處方": "prescription"
  };

  PatientDataListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _titleMap.keys
          .map((key) => Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: key == "化療處方"
                            ? BorderSide(color: Colors.grey.withOpacity(0.5))
                            : BorderSide.none,
                        top: BorderSide(color: Colors.grey.withOpacity(0.5)))),
                child: ListTile(
                  leading: Text(
                    key,
                    style: const TextStyle(
                        color: Color.fromRGBO(37, 57, 83, 1.0),
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Text(patientData[_titleMap[key]]!,
                      style: const TextStyle(
                          color: Color.fromRGBO(37, 57, 83, 1.0),
                          fontSize: 24,
                          fontWeight: FontWeight.w600)),
                ),
              ))
          .toList(),
    );
  }
}
