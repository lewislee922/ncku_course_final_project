import 'package:flutter/material.dart';

class ADRTile extends StatelessWidget {
  final String name;
  final Function(int)? onSlideChange;
  double _currentLevel = 0.0;

  ADRTile({
    Key? key,
    required this.name,
    this.onSlideChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                name,
                style: const TextStyle(
                    fontSize: 22, color: Color.fromRGBO(117, 116, 118, 1.0)),
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                5,
                (index) => Column(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset(
                          "assets/images/smile_scale/smile_$index.png"),
                    ),
                    const SizedBox(height: 2.0),
                    Text("$index級"),
                  ],
                ),
              ),
            ),
            StatefulBuilder(builder: (context, newState) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: SliderTheme(
                  data: SliderThemeData(
                      thumbColor: const Color.fromRGBO(253, 188, 83, 1.0),
                      activeTrackColor: const Color.fromRGBO(253, 188, 83, 1.0),
                      activeTickMarkColor:
                          const Color.fromRGBO(253, 188, 83, 1.0),
                      inactiveTickMarkColor:
                          const Color.fromRGBO(215, 219, 220, 1.0),
                      inactiveTrackColor:
                          const Color.fromRGBO(215, 219, 220, 1.0),
                      tickMarkShape:
                          const RoundSliderTickMarkShape(tickMarkRadius: 6),
                      overlayShape: SliderComponentShape.noOverlay),
                  child: Slider(
                    value: _currentLevel,
                    min: 0.0,
                    max: 4.0,
                    divisions: 4,
                    onChanged: (value) {
                      onSlideChange?.call(value.toInt());
                      newState(() => _currentLevel = value);
                    },
                  ),
                ),
              );
            }),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                "無此副作用",
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(117, 116, 118, 1.0)),
              ),
            ),
            const Divider(
              thickness: 1.3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text("照護小技巧"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
