import 'package:flutter/material.dart';
import 'package:id_rumbuk_app/screens/in_app_browser.screen.dart';

class NewsCard extends StatelessWidget {
  const NewsCard(
      {Key? key,
      required this.newsUrl,
      required this.newsTitle,
      required this.newsDate,
      this.newsImageUrl})
      : super(key: key);

  final String? newsUrl;
  final String? newsTitle;
  final String? newsDate;
  final String? newsImageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4, bottom: 4),
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CustomInAppBrowser(url: newsUrl ?? ''),
              ));
        },
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
              width: 70,
              child: Image.asset('assets/image/img.png', fit: BoxFit.fitWidth,),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.normal,
                          fontSize: 14),
                      newsDate!),
                  Text(
                      style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      newsTitle!)
                ],
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }
}
