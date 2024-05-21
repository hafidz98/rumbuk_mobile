import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id_rumbuk_app/screens/reservation/reservation.controller.dart';

import '../../widgets/custom_chip.widget.dart';

class ReservationOrder extends StatefulWidget {
  const ReservationOrder(
      {Key? key,
      required this.indexB,
      required this.indexF,
      required this.indexR})
      : super(key: key);

  final int indexB;
  final int indexF;
  final int indexR;

  @override
  State<ReservationOrder> createState() => _ReservationOrderState();
}

class _ReservationOrderState extends State<ReservationOrder> {
  final ReservationController reservationController = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var roomData = reservationController.buildingRoomList[widget.indexB]
        .floors![widget.indexF].rooms![widget.indexR];
    var floorData = reservationController
        .buildingRoomList[widget.indexB].floors![widget.indexF];
    var buildingData = reservationController.buildingRoomList[widget.indexB];
    var roomTimeSlot = reservationController.buildingRoomList[widget.indexB]
        .floors![widget.indexF].rooms![widget.indexR].timeSlot;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ruang', style: Theme.of(context).textTheme.titleMedium),
                  Text(
                      '${roomData.name}\n${buildingData.name}, ${floorData.name}',
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
                  Text('${roomData.capacity}',
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tanggal Reservasi',
                      style: Theme.of(context).textTheme.titleMedium),
                  Text(reservationController.selectedDate.day.toString(),
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
              const SizedBox(height: 8),
              Text('Pilih Waktu',
                  style: Theme.of(context).textTheme.titleMedium),
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
                    roomTimeSlot!.length,
                    (index) => CustomChoiceChip(
                      label: '${roomTimeSlot[index].startTime}',
                      selected: (reservationController
                                  .selectedRoomTimeIndex.value ==
                              index) &&
                          reservationController.isSelectedRoomTimeButton.value,
                      onSelected: (selected) {
                        if (roomTimeSlot[index].reserved == false) {
                          reservationController.isSelectedRoomTimeButton.value =
                              true;
                          reservationController.selectedRoomTimeIndex.value =
                              (selected
                                  ? index
                                  : reservationController
                                      .selectedRoomTimeIndex.value);
                          reservationController.selectedRTSID.value =
                              roomTimeSlot[index].rtsId!;
                        }

                        // setState(() {
                        //   reservationController.isSelectedRoomTimeButton.value = true;
                        //   reservationController.selectedRoomTimeIndex.value = (selected ? index : null)!;
                        // });
                      },
                      disabled: roomTimeSlot[index].reserved!,
                    ),
                  ).toList(),
                ),
              ),
              const SizedBox(height: 8),
              Text('Kegiatan', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 4),
              Form(
                key: _formKey,
                child: TextFormField(
                  validator: (value) => (value == null || value.isEmpty)
                      ? '*mohon isi kegiatan atau aktivitas anda'
                      : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: reservationController.activityControllerText,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Kegiatan atau aktivitas'),
                ),
              ),
              const Expanded(child: SizedBox()),
              FilledButton(
                  style: FilledButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: const Text('Pinjam ruangan ini'),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      reservationController.makeReservation();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
