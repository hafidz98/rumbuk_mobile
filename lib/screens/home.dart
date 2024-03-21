import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: 65,
                      color: Colors.black54,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                              'studentName'),
                          Text(
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                              'studentIdNumber')
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
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
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.black26),
                      ),
                      height: 72,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 5,
                            color: Colors.orange,
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 8,
                                ),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                          'Gedung A Lantai 1'),
                                      Text(
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                          'Ruang A101')
                                    ]),
                                const SizedBox(
                                  width: 16,
                                ),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                          'Pukul'),
                                      Text(
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                          '07:00')
                                    ]),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6),
                                    bottomLeft: Radius.circular(6))),
                            padding: const EdgeInsets.all(8),
                            height: 40,
                            width: 150,
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              'Sedang berlangsung',
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
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
                          Text(
                              maxLines: 2,
                              'Belum ada reservasi nih\nYuk, lakukan peminjaman'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Column(
                  children: [
                    const Text(
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        'Berita'),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      margin: EdgeInsets.only(bottom: 8),
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(width: 70,decoration: BoxDecoration(color: Colors.grey,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          ),
                          SizedBox(width: 8,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),'28 Januari 2024'),
                                Text(style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    'Lorem ipsum sit dolor amet constecture elex trea afas amet constecture elex trea afas dera neritosa arko')
                              ],
                            ),
                          ),
                          SizedBox(width: 8,),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(color: Colors.grey,width: 70,
                          ),
                          SizedBox(width: 8,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),'28 Januari 2024'),
                                Text(style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    'Lorem ipsum sit dolor amet constecture elex trea afas amet constecture elex trea afas dera neritosa arko')
                              ],
                            ),
                          ),
                          SizedBox(width: 8,),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(color: Colors.grey,width: 70,
                          ),
                          SizedBox(width: 8,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),'28 Januari 2024'),
                                Text(style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    'Lorem ipsum sit dolor amet constecture elex trea afas amet constecture elex trea afas dera neritosa arko')
                              ],
                            ),
                          ),
                          SizedBox(width: 8,),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(color: Colors.grey,width: 70,
                          ),
                          SizedBox(width: 8,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),'28 Januari 2024'),
                                Text(style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    'Lorem ipsum sit dolor amet constecture elex trea afas amet constecture elex trea afas dera neritosa arko')
                              ],
                            ),
                          ),
                          SizedBox(width: 8,),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(color: Colors.grey,width: 70,
                          ),
                          SizedBox(width: 8,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),'28 Januari 2024'),
                                Text(style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    'Lorem ipsum sit dolor amet constecture elex trea afas amet constecture elex trea afas dera neritosa arko')
                              ],
                            ),
                          ),
                          SizedBox(width: 8,),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(color: Colors.grey,width: 70,
                          ),
                          SizedBox(width: 8,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),'28 Januari 2024'),
                                Text(style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    'Lorem ipsum sit dolor amet constecture elex trea afas amet constecture elex trea afas dera neritosa arko')
                              ],
                            ),
                          ),
                          SizedBox(width: 8,),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(color: Colors.grey,width: 70,
                          ),
                          SizedBox(width: 8,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),'28 Januari 2024'),
                                Text(style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    'Lorem ipsum sit dolor amet constecture elex trea afas amet constecture elex trea afas dera neritosa arko')
                              ],
                            ),
                          ),
                          SizedBox(width: 8,),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Container(color: Colors.grey,width: 70,
                          ),
                          SizedBox(width: 8,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),'28 Januari 2024'),
                                Text(style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    'Lorem ipsum sit dolor amet constecture elex trea afas amet constecture elex trea afas dera neritosa arko')
                              ],
                            ),
                          ),
                          SizedBox(width: 8,),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
