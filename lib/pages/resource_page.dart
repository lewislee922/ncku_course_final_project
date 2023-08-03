import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../UI_components/info_detail.dart';

final _mockData = List.filled(
  6,
  {
    "category": "數位工具",
    "title": "癌友生育健康資訊平台上線中！",
    "content": "這裡有癌友經驗故事及生育決策輔助工具，讓我們陪你一起探索這…",
    "imageUrl":
        "https://www.ecancer.org.tw/uploadfile/Contentfiles/images/癌症希望基金會生育平台-mockup.jpg"
  },
);

class ResourcePage extends StatefulWidget {
  const ResourcePage({super.key});

  @override
  State<ResourcePage> createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  late int _currentPage;
  late PageController _controller;
  final _backgroundColor = const Color.fromRGBO(249, 240, 228, 1.0);

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _controller = PageController(viewportFraction: 0.6);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InfoDetail(
      title: "癌友．關懷資源",
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.only(top: 8.0),
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          _backgroundColor,
                          _backgroundColor.withOpacity(0.9),
                          _backgroundColor.withOpacity(0.8),
                          _backgroundColor.withOpacity(0.6),
                          _backgroundColor.withOpacity(0.1),
                          Colors.transparent
                        ])),
                child: PageView(
                  controller: _controller,
                  onPageChanged: (value) =>
                      setState(() => _currentPage = value),
                  children: _mockData
                      .map((data) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: SizedBox(
                              width: 100,
                              height: 200,
                              child: RescourceCard(
                                  category: data['category']!,
                                  title: data['title']!,
                                  content: data["content"]!,
                                  imageUrl: data['imageUrl']!),
                            ),
                          ))
                      .toList(),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    _mockData.length,
                    (index) => _currentPage == index
                        ? Container(
                            width: 12,
                            height: 12,
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.black),
                          )
                        : Container(
                            width: 10,
                            height: 10,
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade300),
                          )),
              ),
            ),
            const Spacer(),
            const Text(
                "週一至週五9:00-17:30上班時間\n如有任何用藥或副作用的疑問，請聯繫成大醫院\n06-2353535 轉2509,2527",
                textAlign: TextAlign.center,
                strutStyle: StrutStyle(height: 2),
                style: TextStyle(
                    fontSize: 18, color: Color.fromRGBO(106, 106, 104, 1.0)))
          ],
        ),
      ),
    );
  }
}

class RescourceCard extends StatelessWidget {
  final String category;
  final String title;
  final String content;
  final String imageUrl;

  const RescourceCard({
    Key? key,
    required this.category,
    required this.title,
    required this.content,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 4,
                child: Container(
                    width: double.infinity,
                    clipBehavior: Clip.hardEdge,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: AutoSizeText(
                  category,
                  style: const TextStyle(color: Color.fromRGBO(231, 145, 88, 1.0)),
                ),
              ),
              AutoSizeText(
                title,
                maxLines: 2,
                textAlign: TextAlign.justify,
                strutStyle: const StrutStyle(height: 2),
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 8.0),
              AutoSizeText(content,
                  maxLines: 3,
                  strutStyle: const StrutStyle(height: 1.4),
                  style: const TextStyle(
                      fontSize: 18, color: Color.fromRGBO(106, 106, 104, 1.0)))
            ],
          ),
        ),
      ),
    );
  }
}
