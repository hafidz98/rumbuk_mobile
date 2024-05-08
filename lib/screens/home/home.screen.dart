import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:id_rumbuk_app/auth/auth.controller.dart';
import 'package:id_rumbuk_app/model/entity/student.entity.dart';
import 'package:id_rumbuk_app/screens/home/home.controller.dart';
import 'package:id_rumbuk_app/widgets/news_card.widget.dart';
import 'package:id_rumbuk_app/widgets/simple_reservation_card.widget.dart';
import 'package:id_rumbuk_app/widgets/simple_user_profile.widget.dart';

void showLayoutGuidelines() {
  debugPaintSizeEnabled = true;
}

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  //final AuthController _authController = Get.find();
  //final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
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
                Obx(() {
                  return SimpleUserProfile(
                      profileImageUrl: 'https://picsum.photos/200',
                      profileUsername:
                      controller.studentData.value.name ?? 'studentName',
                      profileUserID:
                      controller.studentData.value.studentId ?? 'studentId');
                }),

                const SizedBox(height: 24),
                //Text(),
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
                    if (controller.hasReservation <= 0)
                      emptyReservationInfoCard(context)
                    else
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: SimpleReservationCard(
                              address: 'Gedung 1 Lantai 2',
                              room: 'Ruangan 121',
                              time: '07:15',
                              statusCode: (index + 3).toString()),
                        ),
                      )
                  ],
                ),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        'Berita'),
                    const SizedBox(height: 8),
                    Flexible(
                      fit: FlexFit.loose,
                      child: ListView.separated(
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return const NewsCard(
                                newsUrl: 'www.google.com',
                                newsTitle:
                                    'Google: mainstream search engine over global',
                                newsDate: '20 Jan 24');
                          },
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: 5),
                    ),
                    // ListView(
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   shrinkWrap: true,
                    //   children: generateFakePosts(),
                    // ),
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

  Widget emptyReservationInfoCard(BuildContext context) {
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
