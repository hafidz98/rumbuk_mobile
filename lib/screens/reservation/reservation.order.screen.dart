import 'package:flutter/material.dart';

import '../../widgets/custom_chip.widget.dart';

class ReservationOrder extends StatefulWidget {
  const ReservationOrder({Key? key}) : super(key: key);

  @override
  State<ReservationOrder> createState() => _ReservationOrderState();
}

class _ReservationOrderState extends State<ReservationOrder> {
  int _selectedIndex = 0;
  bool _isSelected = false;

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
                Text('Ruang A101', style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Kapasitas', style: Theme.of(context).textTheme.titleMedium),
                Text('35', style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tanggal Reservasi', style: Theme.of(context).textTheme.titleMedium),
                Text('Selasa, 20 Mei 2024', style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            const SizedBox(height: 8),
            Text('Pilih Waktu', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 4),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.grey.shade500)),
              child: Wrap(
                alignment: WrapAlignment.start,
                direction: Axis.horizontal,
                spacing: 8,
                children: List<Widget>.generate(
                  11,
                  (index) => CustomChoiceChip(
                    label: '07:0${index + 1}',
                    selected: (_selectedIndex == index) && _isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _isSelected = true;
                        _selectedIndex = (selected ? index : null)!;
                      });
                    },
                  ),
                ).toList(),
              ),
            ),
            const SizedBox(height: 8),
            Text('Kegiatan', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 4),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Kegiatan atau aktivitas'),
            ),
            const Expanded(child: SizedBox()),
            FilledButton(
                style: FilledButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                onPressed: () {},
                child: const Text('Pinjam ruangan ini'))
          ],
        ),
      ),
    );
  }
}
