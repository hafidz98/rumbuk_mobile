import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:get/get.dart';
import 'package:id_rumbuk_app/screens/reservation/reservation.controller.dart';
import 'package:id_rumbuk_app/screens/reservation/reservation.order.screen.dart';

import '../../widgets/custom_chip.widget.dart';

class ReservationScreen extends StatelessWidget {
  ReservationScreen({Key? key}) : super(key: key);
  final ReservationController reservationController =
      Get.put(ReservationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomDatePicker(),
                  const SizedBox(height: 8),
                  //Obx(() => const BuildingChipButton()),
                  BuildingChipButton(),
                ],
              ),
            ),
            const Divider(height: 0),
            Expanded(
              child: Obx(
                () {
                  // var data = reservationController
                  //     .buildingRoomList[reservationController.selectedChipButton.value].floors!.length;
                  return ListView.builder(
                    primary: false,
                    itemCount: reservationController
                        .buildingRoomList[
                            reservationController.selectedChipButton.value]
                        .floors!
                        .length,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    itemBuilder: (context, index) {
                      return RoomContentCard(
                        indexB: reservationController.selectedChipButton.value,
                        indexF: index,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoomContentCard extends StatelessWidget {
  const RoomContentCard({Key? key, required this.indexF, required this.indexB})
      : super(key: key);

  final int indexB;
  final int indexF;

  @override
  Widget build(BuildContext context) {
    final ReservationController reservationController = Get.find();
    //var buildingId = reservationController.selectedBuildingId.value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => Text(
            reservationController
                .buildingRoomList[indexB].floors![indexF].name!,
            style: Theme.of(context).textTheme.titleMedium)),
        // Text(reservationController.buildingRoomList[buildingId].floors![indexF].name!,
        //     style: Theme.of(context).textTheme.titleMedium),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey.shade500)),
            child: Obx(
              () => Wrap(
                alignment: WrapAlignment.start,
                spacing: 8,
                runSpacing: 4,
                direction: Axis.horizontal,
                children: List.generate(
                  reservationController
                      .buildingRoomList[indexB].floors![indexF].rooms!.length,
                  (index) => OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        visualDensity: VisualDensity.compact,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))),
                    onPressed: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        showDragHandle: true,
                        useSafeArea: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(32))),
                        context: context,
                        builder: (context) => ReservationOrder(
                          indexB: indexB,
                          indexF: indexF,
                          indexR: index,
                        ),
                      );
                    },
                    child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(reservationController
                            .buildingRoomList[indexB]
                            .floors![indexF]
                            .rooms![index]
                            .name!)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton(
      {Key? key, required this.onPressed, required this.label})
      : super(key: key);

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: FloatingActionButton(
            onPressed: onPressed,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.zero)),
            elevation: 0,
            child: Text(label)),
      ),
    );
  }
}

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({Key? key}) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  // final EasyInfiniteDateTimelineController _controller =
  //     EasyInfiniteDateTimelineController();
  // final DateTime _appsFirstDate = DateTime.now();
  // DateTime _focusDate = DateTime.now().add(const Duration(days: 4));
  // final DateTime _appsLastDate = DateTime.now().add(const Duration(days: 30));
  final ReservationController reservationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return EasyInfiniteDateTimeLine(
      controller: reservationController.eIDTController,
      showTimelineHeader: false,
      disabledDates: List.generate(
          4,
          (index) =>
              reservationController.appsFirstDate.add(Duration(days: index))),
      onDateChange: (selectedDate) {
        setState(() {
          reservationController.focusDate = selectedDate;
          debugPrint(selectedDate.toString());
        });
      },
      timeLineProps: const EasyTimeLineProps(hPadding: 16),
      activeColor: const Color(0xffFFBF9B),
      dayProps: const EasyDayProps(
        height: 56.0,
        width: 56.0,
        dayStructure: DayStructure.dayStrDayNum,
        inactiveDayStyle: DayStyle(
          dayNumStyle: TextStyle(
            fontSize: 18.0,
          ),
        ),
        activeDayStyle: DayStyle(
          dayNumStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      firstDate: reservationController.appsFirstDate,
      focusDate: reservationController.focusDate,
      lastDate: reservationController.appsLastDate,
    );
  }
}

class BuildingChipButton extends StatelessWidget {
  BuildingChipButton({Key? key}) : super(key: key);
  final ReservationController reservationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 8,
          children: List<Widget>.generate(
            reservationController.buildingRoomList.length,
            (index) => CustomChoiceChip(
              label:
                  'Gedung ${reservationController.buildingRoomList[index].name!}',
              selected: reservationController.selectedChipButton.value == index,
              onSelected: (selected) async {
                reservationController.selectedChipButton.value = selected
                    ? index
                    : reservationController.selectedChipButton.value;

                // reservationController.selectedBuildingId.value =
                //     reservationController.buildingList[index].id!;
                // await reservationController.getRoomOnBuildingID(
                //     reservationController.buildingList[index].id!);
              },
            ),
          ).toList(),
        ),
      ),
    );
  }
}
