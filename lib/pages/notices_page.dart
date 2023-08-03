import 'package:flutter/material.dart';

import '../UI_components/info_detail.dart';
import '../UI_components/info_tile.dart';
import '../icon_image.dart';

class NoticesPage extends StatelessWidget {
  final _mockData = {
    "化療前注意事項":
        "化學治療透過抑制不受控制、快速生長的癌細胞，減輕因癌細胞所引起的不適及治療癌症。醫師會跟據您癌症手術或放射治療之前，藉用化學治療來縮小過大的局部腫瘤，以利日後開刀或放射治療",
    "化療中注意事項":
        "通常接受第一次治療時，會建議於住院中接受治療，以便觀察治療的情形及可能產生的副作用。若您在注射抗癌藥物時，注射部位有針刺感、燒灼感、疼痛、紅腫等異狀時，或針頭脫落，請通知護理人員處理。",
  };
  final _imageData = {
    "化療前注意事項": IconImage.injection,
    "化療中注意事項": IconImage.treatment
  };

  NoticesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoDetail(
      title: "化療過程．注意事項",
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListView(
            children: _mockData.keys
                .map((key) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InfoTile(
                          title: key,
                          image: _imageData[key]!,
                          contents: _mockData[key]!),
                    ))
                .toList()),
      ),
    );
  }
}
