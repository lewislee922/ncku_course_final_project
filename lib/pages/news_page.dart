import 'package:flutter/material.dart';

import '../UI_components/info_detail.dart';
import '../UI_components/news_tile.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoDetail(
      title: "癌症．衛教新知",
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: mockNewsData
                .map((news) => NewsTile(
                    category: news['category']!,
                    title: news['title']!,
                    contentPick: news['contentPick']!,
                    imageUrl: news['imageUrl']!,
                    date: news['date']!,
                    border: Border(
                        bottom: mockNewsData.indexOf(news) ==
                                mockNewsData.length - 1
                            ? BorderSide(color: Colors.grey.withOpacity(0.5))
                            : BorderSide.none,
                        top: BorderSide(color: Colors.grey.withOpacity(0.5)))))
                .toList(),
          ),
        ),
      ),
    );
  }
}
