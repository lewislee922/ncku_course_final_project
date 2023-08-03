import 'package:flutter/material.dart';

import '../UI_components/adr_tile.dart';
import '../UI_components/info_detail.dart';

class ADRRecordPage extends StatelessWidget {
  const ADRRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoDetail(
      title: "副作用•紀錄",
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [ADRTile(name: "腹瀉"), ADRTile(name: "嘔吐")],
          ),
        ),
      ),
    );
  }
}
