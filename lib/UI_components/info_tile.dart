import 'package:flutter/material.dart';

import '../UI_components/option_tile.dart';

class InfoTile extends StatelessWidget {
  final String title;
  final String image;
  final String contents;

  const InfoTile({
    Key? key,
    required this.title,
    required this.image,
    required this.contents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(strokeAlign: BorderSide.strokeAlignCenter),
          borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: [
          OptionTile(
            title: title,
            image: image,
            backgroundColor: const Color.fromRGBO(227, 186, 80, 1.0),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              contents,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("...點我看更多",
                  style: TextStyle(color: Colors.black, fontSize: 18)),
            ),
          )
        ],
      ),
    );
  }
}
