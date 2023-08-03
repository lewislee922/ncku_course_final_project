import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';

import '../icon_image.dart';

class TreatmentBadge extends StatelessWidget {
  final bool isFinish;
  final String? finishDate;
  final int? number;
  const TreatmentBadge({
    Key? key,
    required this.isFinish,
    this.number,
    this.finishDate,
  })  : assert(
            (isFinish && finishDate != null) || (!isFinish && number != null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: isFinish ? const FinishBadge() : EmptyBadge(number: number!),
        ),
        isFinish ? Text(finishDate!) : const Text("－ －")
      ],
    );
  }
}

class FinishBadge extends StatelessWidget {
  const FinishBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          ClipPolygon(
            sides: 6,
            borderRadius: 8.0,
            child: Container(
              color: const Color.fromRGBO(250, 241, 179, 1.0),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: ClipPolygon(
                  sides: 6,
                  borderRadius: 8.0,
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(IconImage.badge)),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Transform.translate(
              offset: Offset(
                  -constraints.maxWidth / 12, -constraints.maxWidth / 16),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(4.0),
                width: constraints.maxWidth / 3,
                height: constraints.maxWidth / 3,
                decoration:
                    const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: const FittedBox(child: Icon(Icons.check, color: Colors.grey)),
              ),
            ),
          )
        ],
      );
    });
  }
}

class EmptyBadge extends StatelessWidget {
  final int number;

  const EmptyBadge({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ClipPolygon(
        boxShadows: [
          PolygonBoxShadow(
              color: const Color.fromRGBO(220, 222, 240, 1.0), elevation: 2.0),
        ],
        sides: 6,
        borderRadius: 8.0,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: ClipPolygon(
              sides: 6,
              borderRadius: 8.0,
              child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(211, 222, 254, 1.0),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Text(
                    "$number",
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(145, 149, 206, 1.0)),
                  )),
            ),
          ),
        ),
      );
    });
  }
}
