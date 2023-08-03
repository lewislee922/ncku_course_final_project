import 'package:flutter/material.dart';

import '../UI_components/option_tile.dart';
import '../icon_image.dart';

import '../UI_components/mock_listview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 80, 108, 104),
        toolbarHeight: MediaQuery.of(context).size.height / 8,
        title: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              width: 80,
              height: 80,
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                IconImage.defaultAvator,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            const SizedBox(width: 30),
            const Text(
              "小芋圓",
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              PatientDataListView(),
              const SizedBox(height: 32),
              ...optionsMap.keys.map((key) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: OptionTile(title: key, image: optionsMap[key]!),
                  )),
            ],
          ),
        )),
      ),
      // bottomNavigationBar: BottomNavigationBar(items: [
      //   BottomNavigationBarItem(
      //     icon: Image.asset(IconImage.diary, width: 50, height: 50),
      //     label: "diary",
      //   ),
      //   BottomNavigationBarItem(
      //       icon: Image.asset(IconImage.doctorRun, width: 50, height: 50),
      //       label: "call doctor")
      // ]),
    );
  }
}
