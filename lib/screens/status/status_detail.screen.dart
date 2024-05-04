import 'package:flutter/material.dart';

class ReservationDetail extends StatefulWidget {
  const ReservationDetail({Key? key}) : super(key: key);

  @override
  State<ReservationDetail> createState() => _ReservationDetailState();
}

class _ReservationDetailState extends State<ReservationDetail> {

  @override
  Widget build(BuildContext context) {
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
                Text('Ruang A101\nGedung 1, Lantai 2',
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
                Text('35', style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tanggal Reservasi',
                    style: Theme.of(context).textTheme.titleMedium),
                Text('Selasa, 20 Mei 2024',
                    style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Waktu', style: Theme.of(context).textTheme.titleMedium),
                Text('07:20', style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Kegiatan',
                    style: Theme.of(context).textTheme.titleMedium),
                Text('Sidang Skripsi',
                    style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
