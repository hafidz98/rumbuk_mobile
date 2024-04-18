import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:id_rumbuk_app/screens/reservation/reservation.order.screen.dart';

import '../../widgets/custom_chip.widget.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  final bool _isTimeOfRoomSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: _isTimeOfRoomSelected
          ? CustomFloatingActionButton(
              onPressed: () {}, label: 'Pilih ruangan ini')
          : const SizedBox.shrink(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDatePicker(),
                  SizedBox(height: 8),
                  BuildingChipButton(),
                ],
              ),
            ),
            const Divider(height: 0),
            Flexible(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                children: List<Widget>.generate(
                    10,
                    (index) => RoomContentCard(
                          indexF: (index + 1),
                        )).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoomContentCard extends StatelessWidget {
  const RoomContentCard({Key? key, required this.indexF}) : super(key: key);

  final int indexF;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Lantai $indexF', style: Theme.of(context).textTheme.titleMedium),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey.shade500)),
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 8,
              runSpacing: 4,
              direction: Axis.horizontal,
              children: List.generate(
                  8,
                  (index) => OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          visualDensity: VisualDensity.compact,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4))),
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          showDragHandle: true,
                          useSafeArea: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(32))),
                            context: context,
                            builder: (context) => ReservationOrder());
                      },
                      child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text('Ruang ${index + 1}')))),
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
  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();
  final DateTime _appsFirstDate = DateTime.now();
  DateTime _focusDate = DateTime.now().add(const Duration(days: 4));
  final DateTime _appsLastDate = DateTime.now().add(const Duration(days: 30));

  @override
  Widget build(BuildContext context) {
    return EasyInfiniteDateTimeLine(
      controller: _controller,
      showTimelineHeader: false,
      disabledDates: List.generate(
          4, (index) => _appsFirstDate.add(Duration(days: index))),
      onDateChange: (selectedDate) => setState(() {
        _focusDate = selectedDate;
        debugPrint(selectedDate.toString());
      }),
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
      firstDate: _appsFirstDate,
      focusDate: _focusDate,
      lastDate: _appsLastDate,
    );
  }
}

class BuildingChipButton extends StatefulWidget {
  const BuildingChipButton({Key? key}) : super(key: key);

  @override
  State<BuildingChipButton> createState() => _BuildingChipButtonState();
}

class _BuildingChipButtonState extends State<BuildingChipButton> {
  int? _value = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 8,
        children: List<Widget>.generate(
          4,
          (index) => CustomChoiceChip(
            label: 'Gedung ${index + 1}',
            selected: _value == index,
            onSelected: (selected) => setState(() {
              _value = selected ? index : _value;
            }),
          ),
        ).toList(),
      ),
    );
  }
}


