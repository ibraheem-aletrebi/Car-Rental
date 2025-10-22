import 'package:car_rental/Feature/search/presentation/components/car_color_selector.dart';
import 'package:car_rental/Feature/search/presentation/components/car_type_selector.dart';
import 'package:car_rental/Feature/search/presentation/components/fuel_type_selector.dart';
import 'package:car_rental/Feature/search/presentation/components/location_selector.dart';
import 'package:car_rental/Feature/search/presentation/components/price_range_slider.dart';
import 'package:car_rental/Feature/search/presentation/components/rental_time_selector.dart';
import 'package:car_rental/Feature/search/presentation/components/sitting_capacity_selector.dart';
import 'package:car_rental/core/widgets/custom_data_time_picker.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

Future<void> showFilterBottomSheet(BuildContext context) async {
  await showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      return const _FilterSheetContent();
    },
  );
}

class _FilterSheetContent extends StatefulWidget {
  const _FilterSheetContent();

  @override
  State<_FilterSheetContent> createState() => _FilterSheetContentState();
}

class _FilterSheetContentState extends State<_FilterSheetContent> {
  // RangeValues priceRange = const RangeValues(10, 230);
  // String carType = "All Cars";
  // String rentalTime = "Day";
  // int sittingCapacity = 4;
  // String fuelType = "Electric";
  DateTime? selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.75,
      minChildSize: 0.45,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            children: [
              // Handle الصغير فوق
              Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Filters",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const Divider(),

              // محتوى الفلاتر قابل للسكرول
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  controller: scrollController,

                  children: [
                    CarTypeSelector(),
                    const HeightSpace(),

                    PriceRangeSlider(),
                    const HeightSpace(),

                    CarColorSelector(),
                    const HeightSpace(),

                    RentalTimeSelector(),
                    const HeightSpace(),

                    InkWell(
                      onTap: () async {
                        showDialog(
                          context: context,
                          builder: (context) => CustomDateTimePicker(),
                        );
                      },
                      child: Row(
                        spacing: 8.w,
                        children: [
                          Text(
                            "Pick up and Drop Date",
                            style: const TextStyle(fontSize: 15),
                          ),
                          Spacer(),
                          const Icon(Icons.calendar_today_rounded),
                          Text(
                            selectedDate == null
                                ? "Select Date"
                                : DateFormat(
                                    'd,MMMM,yyyy',
                                  ).format(selectedDate!),
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    const HeightSpace(),
                    LocationSelector(),
                    const HeightSpace(),
                    SittingCapacitySelector(),
                    const HeightSpace(),
                    FuelTypeSelector(),
                    const HeightSpace(height: 40),
                  ],
                ),
              ),

              // زرار اسفل
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Show 100+ Cars",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
