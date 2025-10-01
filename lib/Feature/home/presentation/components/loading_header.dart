import 'package:car_rental/Feature/home/presentation/components/loading_text.dart';
import 'package:flutter/material.dart';

class LoadingHeader extends StatelessWidget {
  const LoadingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [LoadingText(), LoadingText()],
        );
  }
}