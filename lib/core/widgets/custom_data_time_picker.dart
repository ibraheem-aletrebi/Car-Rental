import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomDateTimePicker extends StatefulWidget {
  const CustomDateTimePicker({super.key});

  @override
  State<CustomDateTimePicker> createState() => _CustomDateTimePickerState();
}

class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  @override
  void initState() {
    super.initState();

    startDate = DateTime.now();
    endDate = startDate!.add(const Duration(hours: 1));

    startTime = TimeOfDay.fromDateTime(startDate!);
    endTime = TimeOfDay.fromDateTime(endDate!);
  }

  /// يختار وقت البداية ويحدث النهاية تلقائيًا +1 ساعة
  Future<void> _selectStartTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: startTime ?? TimeOfDay.now(),
    );

    if (time != null) {
      final newStart = DateTime(
        startDate!.year,
        startDate!.month,
        startDate!.day,
        time.hour,
        time.minute,
      );

      // لو النهاية القديمة بقت قبل الجديدة → عدّلها
      final newEnd = (endDate!.isBefore(newStart))
          ? newStart.add(const Duration(hours: 1))
          : endDate!;

      setState(() {
        startTime = time;
        startDate = newStart;
        endDate = newEnd;
        endTime = TimeOfDay.fromDateTime(newEnd);
      });
    }
  }

  /// يختار وقت النهاية (مع التحقق)
  Future<void> _selectEndTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: endTime ?? TimeOfDay.now(),
    );

    if (time != null) {
      final newEnd = DateTime(
        endDate!.year,
        endDate!.month,
        endDate!.day,
        time.hour,
        time.minute,
      );

      // // لو النهاية قبل البداية → عدّلها +1 ساعة تلقائيًا
      // if (newEnd.isBefore(startDate!)) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(
      //       content: Text("End time cannot be before start time"),
      //       duration: Duration(seconds: 2),
      //     ),
      //   );
      //   return;
      // }

      setState(() {
        endTime = time;
        endDate = newEnd;
      });
    }
  }

  /// عند تغيير التاريخ من الكالندر
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      final newStart = args.value.startDate!;
      final newEnd =
          args.value.endDate ?? newStart.add(const Duration(hours: 1));

      // لو المستخدم اختار نهاية قبل البداية
      final validEnd = newEnd.isBefore(newStart)
          ? newStart.add(const Duration(hours: 1))
          : newEnd;

      setState(() {
        startDate = newStart;
        endDate = validEnd;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat('hh:mm a');

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Time", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),

            // Time buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTimeButton(
                  icon: Icons.access_time,
                  label: startTime == null
                      ? "Start Time"
                      : timeFormat.format(
                          DateTime(0, 0, 0, startTime!.hour, startTime!.minute),
                        ),
                  onTap: _selectStartTime,
                  selected: true,
                ),
                _buildTimeButton(
                  icon: Icons.timelapse,
                  label: endTime == null
                      ? "End Time"
                      : timeFormat.format(
                          DateTime(0, 0, 0, endTime!.hour, endTime!.minute),
                        ),
                  onTap: _selectEndTime,
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Date picker
            SfDateRangePicker(
              onSelectionChanged: _onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.range,
              initialSelectedRange: PickerDateRange(startDate, endDate),
              backgroundColor: Colors.white,
              selectionColor: Colors.black,
              startRangeSelectionColor: Colors.black,
              endRangeSelectionColor: Colors.black,
              todayHighlightColor: Colors.black,

              headerStyle: const DateRangePickerHeaderStyle(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.transparent,
                textAlign: TextAlign.center,
              ),

              monthCellStyle: const DateRangePickerMonthCellStyle(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              yearCellStyle: DateRangePickerYearCellStyle(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                todayTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              showActionButtons: true,

              onCancel: () => Navigator.pop(context),
              onSubmit: (value) {
                Navigator.pop(context, {
                  'startDate': startDate,
                  'endDate': endDate,
                  'startTime': startTime,
                  'endTime': endTime,
                });
              },
              monthViewSettings: const DateRangePickerMonthViewSettings(
                firstDayOfWeek: 7,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool selected = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.black : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? Colors.black : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 20, color: selected ? Colors.white : Colors.black),
            const SizedBox(width: 8),
            Container(
              height: 20,
              width: 1,
              color: selected ? Colors.white : Colors.black,
              margin: const EdgeInsets.symmetric(horizontal: 8),
            ),
            Text(
              label,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
