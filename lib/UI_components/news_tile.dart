import 'package:flutter/material.dart';

final mockNewsData = [
  {
    "category": "治療處方 大腸癌",
    "title": "第四期大腸癌肝轉移可治癒？ RAS基因未變異機會高",
    "contentPick": "大腸癌連續15年蟬聯十大癌症之冠，每31分14秒就有1...",
    "date": "2023/07/18",
    "imageUrl":
        "https://www.ecancer.org.tw/uploadfile/ContentImage/2023/20230726/20230726040912988.jpg"
  },
  {
    "category": "治療處方 血癌",
    "title": "好發老人的慢性淋巴性白血病(CLL)，症狀不明顯...",
    "contentPick": "慢性淋巴性白血病(Chronic Lymphocyti...",
    "date": "2023/07/08",
    "imageUrl":
        "https://www.ecancer.org.tw/uploadfile/ContentImage/2023/20230727/20230727035441813.jpg"
  },
  {
    "category": "治療處方 血癌",
    "title": "慢性淋巴性白血病(CLL)三情況 立即治療提...",
    "contentPick": "白血病分為慢性淋巴性白血病...",
    "date": "2023/07/21",
    "imageUrl":
        "https://www.ecancer.org.tw/uploadfile/ContentImage/2023/20230719/20230719113631743.jpg"
  },
];

class NewsTile extends StatelessWidget {
  final String category;
  final String title;
  final String contentPick;
  final String imageUrl;
  final String date;
  final Border? border;

  const NewsTile({
    Key? key,
    required this.category,
    required this.title,
    required this.contentPick,
    required this.imageUrl,
    required this.date,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: border),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                child: Text(
                  category,
                  style: const TextStyle(color: Color.fromRGBO(113, 108, 171, 1.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                child: Text(
                  date,
                  style: const TextStyle(
                      color: Color.fromRGBO(156, 156, 158, 1.0),
                      fontWeight: FontWeight.w800),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Text(
                        title,
                        strutStyle: const StrutStyle(height: 2),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        contentPick,
                        strutStyle: const StrutStyle(height: 2),
                        style: const TextStyle(
                            color: Color.fromRGBO(115, 114, 116, 1.0)),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0, bottom: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      clipBehavior: Clip.hardEdge,
                      height: 150,
                      width: 150,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox.expand(
                              child: Image.network(imageUrl, fit: BoxFit.fill)),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                                splashRadius: 16.0,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_outline,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
