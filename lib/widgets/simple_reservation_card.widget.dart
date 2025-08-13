import 'package:flutter/material.dart';
import 'package:id_rumbuk_app/screens/status/status_detail.screen.dart';

class SimpleReservationCard extends StatelessWidget {
  const SimpleReservationCard(
      {Key? key,
      required this.address,
      required this.room,
      required this.time,
      required this.statusCode,
      required this.reservationId})
      : super(key: key);

  final int reservationId;
  final String address;
  final String room;
  final String time;
  final String statusCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.black26),
      ),
      height: 72,
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            showDragHandle: true,
            useSafeArea: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
            context: context,
            builder: (context) => SizedBox(
                height: MediaQuery.of(context).size.height * 3 / 4,
                child: ReservationDetail(
                  id: reservationId,
                )),
          );
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(const SnackBar(content: Text('reservasi')));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 5,
              color: colorStatusCode(statusCode),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 8),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                          address),
                      Text(
                          style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          room)
                    ]),
                const SizedBox(width: 16),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                          'Pukul'),
                      Text(
                          style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          time)
                    ]),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: colorStatusCode(statusCode),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              padding: const EdgeInsets.all(8),
              height: MediaQuery.of(context).size.width * 0.1,
              width: MediaQuery.of(context).size.width * 0.35,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                  textStatus(statusCode),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Color colorStatusCode(String code) {
    switch (code) {
      case '0':
        return Colors.red;
      case '1':
        return Colors.blue;
      case '2':
        return Colors.orange;
      case '3':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  String textStatus(String code) {
    switch (code) {
      case '0':
        return 'Batal';
      case '1':
        return 'Akan datang';
      case '2':
        return 'Sedang berlangsung';
      case '3':
        return 'Selesai';
      default:
        return 'Lainnya';
    }
  }
}
