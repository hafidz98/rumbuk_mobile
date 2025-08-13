import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id_rumbuk_app/screens/status/status.controller.dart';
import 'package:intl/intl.dart';

class ReservationDetail extends StatelessWidget {
  ReservationDetail({super.key, required this.id});
  final StatusController _statusController = Get.find();
  final int id;
  
  
  @override
  Widget build(BuildContext context) {
    var data = _statusController.selectedReservation.firstWhere((e) => e.id == id);
    var dateFormat = DateFormat('E, d MMMM yyyy', 'id_ID');
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ruang', style: Theme.of(context).textTheme.titleMedium),
                Text('${data.room!.room}\n${data.room!.building}, ${data.room!.floor}',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.end),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Kapasitas',
                    style: Theme.of(context).textTheme.titleMedium),
                Text('${data.room!.capacity}', style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tanggal Reservasi',
                    style: Theme.of(context).textTheme.titleMedium),
                Text(dateFormat.format(DateTime.parse(data.bookingDate!).toLocal()),
                    style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Waktu', style: Theme.of(context).textTheme.titleMedium),
                Text('${data.room!.startTime}', style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Kegiatan',
                    style: Theme.of(context).textTheme.titleMedium),
                Text('${data.activity}',
                    style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
