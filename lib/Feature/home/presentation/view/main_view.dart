import 'package:car_rental/Feature/home/presentation/components/main_view_body.dart';
import 'package:flutter/material.dart';


class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: MainViewBody()),
    );
  }
}

