import 'package:flutter/material.dart';

import '../../widgets/simple_reservation_card.widget.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

enum StatusText {
  allStatus('Semua status', '9'),
  upcoming('Akan datang', '1'),
  ongoing('Berlangsung', '2'),
  cancel('Batal', '0'),
  done('Selesai', '3');

  const StatusText(this.statusText, this.value);
  final String statusText;
  final String value;
}

class _StatusScreenState extends State<StatusScreen> {
  final TextEditingController statusController = TextEditingController();
  StatusText? selectedStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: DropdownMenu<StatusText>(
                  initialSelection: StatusText.allStatus,
                  controller: statusController,
                  width: MediaQuery.of(context).size.width * 0.5,
                  hintText: 'Status',
                  dropdownMenuEntries: StatusText.values
                      .map<DropdownMenuEntry<StatusText>>(
                        (StatusText text) => DropdownMenuEntry(
                            value: text, label: text.statusText),
                      )
                      .toList(),
                  onSelected: (value) => setState(() {
                    selectedStatus = value;
                  }),
                ),
              ),
              if (selectedStatus != null)
                Text(
                    'You selected a ${selectedStatus?.statusText}, val ${selectedStatus?.value}')
              else
                const Text('Please select a color and an icon.'),
              ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: SimpleReservationCard(
                        address: 'Gedung 1 Lantai 2',
                        room: 'Ruangan 121',
                        time: '07:15',
                        statusCode: (index).toString()),
                  );
                },
                shrinkWrap: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
