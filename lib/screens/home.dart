import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:id_rumbuk_app/widgets/news_card.widget.dart';
import 'package:id_rumbuk_app/widgets/simple_reservation_card.widget.dart';
import 'package:id_rumbuk_app/widgets/simple_user_profile.widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

void showLayoutGuidelines() {
  debugPaintSizeEnabled = true;
}

class _HomeScreenState extends State<HomeScreen> {
  int hasReservation = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                const SimpleUserProfile(
                    profileImageUrl: 'https://picsum.photos/200',
                    profileUsername: 'Adnan Rzifka',
                    profileUserID: '24201003'),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        'Reservasi aktif'),
                    const SizedBox(
                      height: 8,
                    ),
                    if (hasReservation <= 0)
                      emptyReservationInfoCard()
                    else
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          itemBuilder: (context, index) =>
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: SimpleReservationCard(
                                    address: 'Gedung 1 Lantai 2',
                                    room: 'Ruangan 121',
                                    time: '07:15',
                                    statusCode: index.toString()),
                              ),)
                  ],
                ),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        'Berita'),
                    const SizedBox(height: 8),
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: generateFakePosts(),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emptyReservationInfoCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.black26),
      ),
      height: 72,
      width: MediaQuery.of(context).size.width,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.info_outline_rounded, size: 32),
          SizedBox(
            width: 16,
          ),
          Text(maxLines: 2, 'Belum ada reservasi nih\nYuk, lakukan peminjaman'),
        ],
      ),
    );
  }

  List<Widget> generateFakePosts() {
    final posts = <Widget>[];
    for (var i = 1; i <= 5; i++) {
      posts.add(const NewsCard(
          newsUrl: 'www.google.com',
          newsTitle: 'Google: mainstream search engine over global',
          newsDate: '20 Jan 24'));
      posts.add(const Divider());
    }
    return posts;
  }
}
