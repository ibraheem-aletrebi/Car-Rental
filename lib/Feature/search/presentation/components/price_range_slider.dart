import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider({super.key});

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  RangeValues _values = const RangeValues(10, 230);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        const Text(
          "Price range",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 60,
          child: CustomPaint(
            painter: _HistogramPainter(),
            child: const SizedBox.expand(),
          ),
        ),
        RangeSlider(
          padding: const EdgeInsets.all(0),
          values: _values,
          min: 10,
          max: 230,
          divisions: 100,
          onChanged: (val) => setState(() => _values = val),
          activeColor: Colors.black,
          inactiveColor: Colors.grey.shade300,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _priceLabel("Minimum", "\$${_values.start.round()}"),
            _priceLabel("Maximum", "\$${_values.end.round()}+"),
          ],
        ),
      ],
    );
  }

  Widget _priceLabel(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const HeightSpace(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

/// رسم histogram بسيط أعلى السلايدر
class _HistogramPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black87
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.square;

    final random = Random(5); // ثابت لإعطاء شكل ثابت
    final barCount = 50;
    final barWidth = size.width / barCount;

    for (int i = 0; i < barCount; i++) {
      final barHeight = random.nextDouble() * size.height * .8;
      final x = i * barWidth + barWidth / 2;
      final y = size.height - barHeight;
      canvas.drawLine(Offset(x, size.height), Offset(x, y), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
