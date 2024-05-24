import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id_rumbuk_app/screens/status/status.controller.dart';

import '../../widgets/simple_reservation_card.widget.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

// enum StatusText {
//   allStatus('Semua status', '9'),
//   upcoming('Akan datang', '1'),
//   ongoing('Berlangsung', '2'),
//   cancel('Batal', '0'),
//   done('Selesai', '3');
//
//   const StatusText(this.statusText, this.value);
//   final String statusText;
//   final String value;
// }

class _StatusScreenState extends State<StatusScreen> {
  final StatusController _statusController = Get.put(StatusController());
  //final TextEditingController statusController = TextEditingController();
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
              Obx(
                () => DropdownMenu<StatusText>(
                  initialSelection: _statusController.selectedStatus.value,
                  controller: _statusController.statusControllerDropdown,
                  width: MediaQuery.of(context).size.width * 0.5,
                  hintText: 'Status',
                  dropdownMenuEntries: StatusText.values
                      .map<DropdownMenuEntry<StatusText>>(
                        (StatusText text) => DropdownMenuEntry(
                            value: text, label: text.statusText),
                      )
                      .toList(),
                  onSelected: (newValue) {
                    setState(() {
                      _statusController.selectedStatus.value = newValue!;
                      _statusController.getSelectedReservation(
                          _statusController.selectedStatus.value?.value ?? '9');
                    });
                  },
                ),
              ),
              // Flexible(
              //   child: DropdownMenu<StatusText>(
              //     initialSelection: StatusText.allStatus,
              //     controller: _statusController.statusControllerDropdown,
              //     width: MediaQuery.of(context).size.width * 0.5,
              //     hintText: 'Status',
              //     dropdownMenuEntries: StatusText.values
              //         .map<DropdownMenuEntry<StatusText>>(
              //           (StatusText text) => DropdownMenuEntry(
              //               value: text, label: text.statusText),
              //         )
              //         .toList(),
              //     onSelected: (value) => setState(() {
              //       selectedStatus = value;
              //     }),
              //   ),
              // ),
              const SizedBox(height: 16),
              Obx(
                () {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: _statusController.selectedReservation.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: SimpleReservationCard(
                              address: _statusController
                                      .selectedReservation[index].room!.floor! +
                                  _statusController.selectedReservation[index]
                                      .room!.building!,
                              room: _statusController
                                  .selectedReservation[index].room!.room!,
                              time: _statusController
                                  .selectedReservation[index].room!.startTime!,
                              statusCode: _statusController
                                  .selectedReservation[index].status!),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
