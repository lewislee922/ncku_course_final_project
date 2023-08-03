import 'package:flutter/material.dart';

import '../icon_image.dart';

class InfoDetail extends StatelessWidget {
  final Widget? body;
  final String title;

  const InfoDetail({
    Key? key,
    this.body,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              width: double.infinity,
              height: 150,
              child: Stack(
                children: [
                  SizedBox.expand(
                    child: Image.asset(
                      IconImage.banner,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.arrow_back_ios)),
                    ),
                  )
                ],
              )),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            color: const Color.fromARGB(255, 80, 108, 104),
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(child: body ?? const SizedBox()),
        ],
      ),
    );
  }
}
